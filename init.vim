" Information about using Lua as a configuration language:
" https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

lua<<EOF
require("plugins")
require("rust_analyzer")
require("lsp")
require("general")
EOF

" Set the built-in shell to use Powershell on Windows
let &shell = has('win32') ? 'powershell' : 'pwsh'
set shellquote= shellpipe=\| shellxquote=
set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8

" Source vim configuration upon save
augroup vimrc     
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END



" ---------------------------------------------------------
" Macros
" ---------------------------------------------------------

" :help key-notation
" :help map-overview


" Easier buffer switching
map <leader><leader> <C-^>

" Use normal paste command
" imap <C-v> <Esc>"+pa

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Resizing panes
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Moving between panes
nnoremap <leader><Down> <C-W><C-J>
nnoremap <leader><Up> <C-W><C-K>
nnoremap <leader><Left> <C-W><C-H>
nnoremap <leader><Right> <C-W><C-L>

" Close braces automatically
imap {<CR> {<CR>}<Esc>O
imap [<CR> [<CR>]<Esc>O
imap (<CR> (<CR>)<Esc>O

" Fix indentation on selection
nmap <leader>= gg=G<C-O>

" Start fuzzy finder
nmap <leader>f :call fzf#run({'sink': 'e', 'source': 'git ls-files', 'window': {'width': 0.9, 'height': 0.6}})<Enter>

" Start Nerd Tree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Use incsearch-easymotion for search
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

let g:EasyMotion_smartcase = 1

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Move to Word
map  <Leader>W <Plug>(easymotion-bd-W)



" ----------------------------------------------------------
"  LSP
" ----------------------------------------------------------

" Code navigation shortcuts
nnoremap gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap gH 	<cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gD   	<cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
