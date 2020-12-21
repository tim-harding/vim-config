set nocompatible
filetype plugin on
runtime macros/matchit.vim
syntax on

" :setlocal spell spelllang=en_us

" For YouCompleteMe
set encoding=utf-8

set nohlsearch
set linebreak
set history=200
set number
set ignorecase
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set tabstop=4
set shiftwidth=4
set cursorline
set linespace=2

" Support :find
set path+=**

" Note: Windows 10 adds python.exe as an alias to the Windows Store,
" making it so Neovim is unable to find the executable. Use the Windows
" settings page `Manage app execution aliases` to turn this off. 
" We need a python install with the neovim package installed with pip. 
let g:python3_host_prog='C:/Windows/py.exe'
let g:netrw_banner=0
let mapleader=","

" :help key-notation
" :help map-overview

let mapleader = " "

" Map Ctrl-Backspace to delete the previous word
map! <C-BS> <C-W>

" t places cursor at top of window
nmap t zt

" Capitalize last word
map! <C-L> <Esc>gUiwea

imap {<CR> {<CR>}<Esc>O

" Move on display lines
nmap <silent> j gj
nmap <silent> k gk

imap jj <Esc>

nmap <A-j> }
nmap <A-k> {

" Homerow numpad
map! <A-S-Space> 0
map! <A-M>     1
map! <A-N>     1
map! <A-S-lt>  2
map! <A->>     3
map! <A-J>     4
map! <A-K>     5
map! <A-L>     6
map! <A-U>     7
map! <A-I>     8
map! <A-O>     9
map! <A-P>     9

" Fix indentation
nmap <leader>= gg=G<C-O>

" Paste like a human being
" Doesn't seem to be working. Revisit. 
map! <C-v>=jj"+pi

" YouCompleteMe semantic analysis shortcuts
" nmap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set shell=powershell shellquote=( shellpipe=\| shellxquote=
" set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
" set shellredir=\|\ Out-File\ -Encoding\ UTF8

if has('win32')
    set shell=powershell
    set shellquote= shellpipe=\| shellxquote=
    set shellcmdflag=\ -NoLogo\ -ExecutionPolicy\ RemoteSigned\ -Command
    set shellredir=\|\ Out-File\ -Encoding\ UTF8
endif

" Add blank lines without inserting
" nmap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nmap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" :PlugInstall
" :PlugUpdate
" :PlugClean
call plug#begin('~/.local/share/nvim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'arcticicestudio/nord-vim'

" Note: Must follow additional install directions. Cd into
" ~/.local/share/nvim/plugged and run 
" `install.py --all --clangd-completer --msvc 15`
" Plug 'ycm-core/YouCompleteMe'

call plug#end()

colorscheme nord
