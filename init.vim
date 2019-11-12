set nocompatible
filetype plugin on
runtime macros/matchit.vim

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

" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>

" Move on display lines
onoremap <silent> j gj
onoremap <silent> k gk

syntax on
colorscheme onedark

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
call plug#end()
