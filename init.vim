" Information about using Lua as a configuration language:
" https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

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
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'neovim/nvim-lspconfig'


" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

call plug#end()



" --------------------------------------------------------
" General setup
" --------------------------------------------------------

lua<<EOF
-- Note: Much of Vim Sensible is included by Neovim defaults. See
-- https://github.com/neovim/neovim/issues/2676

-- Always keep at least 5 screen columns 
-- to the left and to the right of the cursor if 'nowrap' is set.  
vim.opt.sidescrolloff = 5

-- set encoding=utf-8
-- Set text encoding to UTF-8 rather than ASCII
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Makes `set :list`, which enables visible whitespace, prettier
vim.opt.listchars = {
	extends = "›",
	precedes = "‹",
	nbsp = "·",
	trail = "·",
	eol = "↲",
	tab = "» ",
}

-- Removes window- or buffer-local options from being affected
-- by the :mkview command
vim.opt.viewoptions:remove("options")

-- Enable the use of the mouse in all modes
vim.opt.mouse = "a"

-- Allow switching buffers without saving
vim.opt.hidden = true

-- Turns on spell checking. 
-- More information at :spell-quickstart
-- :setlocal spell spelllang=en_us

-- Forces a gap between the cursor and the top and bottom of the screen
vim.opt.scrolloff = 3

-- Turns off the highlight left behind by searches
vim.opt.hlsearch = false

-- Only wrap text at word boundaries
vim.opt.linebreak = true

-- Embiggen the undo history
vim.opt.history = 1024

-- Turn on line numbering
vim.opt.number = true

-- Search case-insensitive unless the term includes a capital
vim.opt.ignorecase = true

-- Don't convert tabs to spaces by default
vim.opt.expandtab = false

-- Use spaces for tabs if the rest of the file already does
vim.opt.copyindent = true

-- When changing a line's indentation, try to preserve the tab or space pattern
vim.opt.preserveindent = true

-- Preserve indent when moving to a new line
vim.opt.autoindent = true

-- Affects the number of spaces per tab when indenting with spaces
-- Backspace will delete a full tab character rather than a single space, good
-- for Python. 
vim.opt.softtabstop = 0

-- Display width of a tab character
vim.opt.tabstop = 4

-- Affects the behavior of auto-indent and shift commands
vim.opt.shiftwidth = 4

-- Highlights the line the cursor is on
vim.opt.cursorline = true

-- Give lines a little more breathing room
vim.opt.linespace = 2

-- Support :find
vim.opt.path:append("**")

vim.opt.relativenumber = true

vim.g.mapleader = ","

vim.cmd("colorscheme nord")

-- Configuration: Choose a statusline that makes 
-- configuring this with Lua easy to understand
vim.g.lightline = '{ "colorscheme": "nord" }'

-- Note: Windows 10 adds python.exe as an alias to the Windows Store,
-- making it so Neovim is unable to find the executable. Use the Windows
-- settings page `Manage app execution aliases` to turn this off. 
-- We need a python install with the neovim package installed with pip. 
vim.g.python3_host_prog = "C:/Windows/py.exe"
vim.g.netrw_banner = 0
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

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Move to Word
map  <Leader>W <Plug>(easymotion-bd-W)



" ----------------------------------------------------------
"  Rust LSP
" ----------------------------------------------------------

" For information on setting this all up:
" https://sharksforarms.dev/posts/neovim-rust/

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

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

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()


" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

lua require("init")
