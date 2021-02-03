" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.2

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif



" vim:set ft=vim et sw=2:

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
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'

call plug#end()



" --------------------------------------------------------
" General setup
" --------------------------------------------------------

" Out-of-the-box completions
" Omni completion ~ Intellisense
set omnifunc=syntaxcomplete#Complete

" Turns on spell checking. 
" More information at :spell-quickstart
" :setlocal spell spelllang=en_us

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

" Search case-insensitive unless the term includes a capital
set ignorecase

" Don't convert tabs to spaces by default
set noexpandtab

" Use spaces for tabs if the rest of the file already does
set copyindent

" When changing a line's indentation, try to preserve the tab or space pattern
set preserveindent

" Preserve indent when moving to a new line
set autoindent

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

colorscheme nord

" For Neovide
set guifont=Cascadia\ Code

" Turn on lightline
set laststatus=2

let g:lightline = { 'colorscheme': 'nord' }

" Note: Windows 10 adds python.exe as an alias to the Windows Store,
" making it so Neovim is unable to find the executable. Use the Windows
" settings page `Manage app execution aliases` to turn this off. 
" We need a python install with the neovim package installed with pip. 
let g:python3_host_prog='C:/Windows/py.exe'
let g:netrw_banner=0

" Set the built-in shell to use Powershell
let &shell = has('win32') ? 'powershell' : 'pwsh'
set shellquote= shellpipe=\| shellxquote=
set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8




" ---------------------------------------------------------------
" LSP setup
" ---------------------------------------------------------------
lua require('lspconfig').rust_analyzer.setup({})

autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Turn off auto popup
" let g:completion_enable_auto_popup = 0

" Use completions on all files
autocmd BufEnter * lua require'completion'.on_attach()





" ---------------------------------------------------------
" Macros
" ---------------------------------------------------------

" Easier completion for Emmet
nmap <leader>c <C-y>,

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

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" May turn these back on, but SuperTab may solve my problems

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Enter key for omni completion works as expected
" :inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" map <c-p> to manually trigger completion
" imap <silent> <c-p> <Plug>(completion_trigger)

" Use tabs for completion
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

nnoremap <leader>h <C-W><C-J>
nnoremap <leader>t <C-W><C-K>
nnoremap <leader>d <C-W><C-H>
nnoremap <leader>n <C-W><C-L>

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
" nnoremap <leader>h :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <leader>t :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Start fuzzy finder
nmap <leader>f :call fzf#run({'sink': 'e', 'source': 'git ls-files', 'window': {'width': 0.9, 'height': 0.6}})<Enter>

nnoremap <leader>nt :NERDTreeToggle<CR>
