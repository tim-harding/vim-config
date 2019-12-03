set nocompatible
filetype plugin on
runtime macros/matchit.vim
syntax on
colorscheme onedark

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
set guifont=Hack:h10
set linespace=2

" Note: Windows 10 adds python.exe as an alias to the Windows Store,
" making it so Neovim is unable to find the executable. Use the Windows
" settings page `Manage app execution aliases` to turn this off. 
" We need a python install with the neovim package installed with pip. 
let g:python3_host_prog='C:/Windows/py.exe'
let g:netrw_banner = 0

" :help key-notation
" :help map-overview

" Map Ctrl-Backspace to delete the previous word
map! <C-BS> <C-W>

" t places cursor at top of window
nmap t zt

" Capitalize last word
map! <C-L> <Esc>gUiwea

imap {<CR> {<CR>}<Esc>

" Move on display lines
nmap <silent> j gj
nmap <silent> k gk

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

" Add blank lines without inserting
nmap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nmap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" :PlugInstall
" :PlugUpdate
" :PlugClean
call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'
call plug#end()
