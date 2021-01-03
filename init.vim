" -------------------------------------------------------
" Plugins
" -------------------------------------------------------

" :PlugInstall
" :PlugUpdate
" :PlugClean
" :PlugUpgrade upgrades Vim Plug
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'

call plug#end()



" --------------------------------------------------------
" General setup
" --------------------------------------------------------

" Turn off compatibility with Vi for full Vim features
set nocompatible

" Enable filetype detection
filetype plugin on

" Enable bracket matching
runtime macros/matchit.vim

" Enable syntax highlighting
syntax on

" Turns on spell checking. 
" More information at :spell-quickstart
" :setlocal spell spelllang=en_us

" For YouCompleteMe
set encoding=utf-8

" Forces a gap between the cursor and the top and bottom of the screen
set scrolloff=3

" Turns off the highlight left behind by searches
set nohlsearch

" Only wrap text at word boundaries
set linebreak

" Embiggen the undo history
set history=1024

" Turn on line numbering
set number

" Search case-insensitive unless the term includes a capical
set ignorecase

" Don't convert tabs to spaces by default
set noexpandtab

" Use spaces for tabs if the rest of the file already does
set copyindent

" Auto-indentation
set preserveindent

" Affects the number of spaces per tab when indenting with spaces
" Backspace will delete a full tab character rather than a single space, good
" for Python. 
set softtabstop=0

" Display width of a tab character
set tabstop=4

" Affects the behavior of auto-indent and shift commands
set shiftwidth=4

" Highlights the line the cursor is on
set cursorline

" Give lines a little more breathing room
set linespace=2

" Support :find
set path+=**

" Note: Windows 10 adds python.exe as an alias to the Windows Store,
" making it so Neovim is unable to find the executable. Use the Windows
" settings page `Manage app execution aliases` to turn this off. 
" We need a python install with the neovim package installed with pip. 
let g:python3_host_prog='C:/Windows/py.exe'
let g:netrw_banner=0

" Set the built-in shell to use Powershell
set shell=powershell shellquote=( shellpipe=\| shellxquote=
set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8

colorscheme nord

lua require('lspconfig').rust_analyzer.setup({})

autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Turn off auto popup
" let g:completion_enable_auto_popup = 0

" Use completions on all files
autocmd BufEnter * lua require'completion'.on_attach()

" For Neovide
set guifont=Cascadia\ Code

" Turn on lightline
set laststatus=2

let g:lightline = { 'colorscheme': 'nord' }




" ---------------------------------------------------------
" Macros
" ---------------------------------------------------------

" :help key-notation
" :help map-overview

let mapleader = " "

" Language server commands
nnoremap K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" map <c-p> to manually trigger completion
" imap <silent> <c-p> <Plug>(completion_trigger)

" Use tabs for completion
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

nnoremap <leader>H <C-W><C-J>
nnoremap <leader>T <C-W><C-K>
nnoremap <leader>D <C-W><C-H>
nnoremap <leader>N <C-W><C-N>

" Map Ctrl-Backspace to delete the previous word
map! <C-BS> <C-W>

imap {<CR> {<CR>}<Esc>O

" Move on display lines
" nmap <silent> j gj
" nmap <silent> k gk

imap zz <Esc>

" Homerow numpad
map! <A-S-Space> 0
map! <A-B>       0
map! <A-M>       1
map! <A-W>       2
map! <A-V>       3
map! <A-H>       4
map! <A-T>       5
map! <A-N>       6
map! <A-G>       7
map! <A-C>       8
map! <A-?>       9
map! <A-L>       9

" Easy hjkl movement in Dvorak
map <A-d> h
map <A-h> j
map <A-t> k
map <A-n> l

" Easier paragraph movement
noremap <A-H> }
noremap <A-T> {

" Fix indentation on selection
nmap <leader>= gg=G<C-O>

" Add blank lines without inserting
nnoremap <leader>h :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <leader>t :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Start fuzzy finder
nmap <leader>f :call fzf#run({'sink': 'e', 'source': 'git ls-files', 'window': {'width': 0.9, 'height': 0.6}})<Enter>

nnoremap <leader>nt :NERDTreeToggle<CR>
