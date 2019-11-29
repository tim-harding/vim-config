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

" Capitalize last word
:imap <C-L> <Esc>gUiwea

inoremap {<CR> {<CR>}<Esc>O

" Move on display lines
onoremap <silent> j gj
onoremap <silent> k gk

syntax on
colorscheme onedark

" For YouCompleteMe
set encoding=utf-8

" Note: Windows 10 adds python.exe as an alias to the Windows Store,
" making it so Neovim is unable to find the executable. Use the Windows
" settings page `Manage app execution aliases` to turn this off. 
" We need a python install with the neovim package installed with pip. 
let g:python3_host_prog='C:/Windows/py.exe'

" :PlugInstall
" :PlugUpdate
" :PlugClean
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
call plug#end()

" See :help deoplete-options for a list of configuration options. 
let g:deoplete#enable_at_startup = 1

" deplete-clang settings
let g:deoplete#sources#clang#libclang_path = 'C:/Program Files/LLVM/lib/libclang.lib'
let g:deoplete#sources#clang#clang_header = 'C:/Program Files/LLVM/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
