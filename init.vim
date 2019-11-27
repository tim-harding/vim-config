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

" :PlugInstall
" :PlugUpdate
" :PlugClean
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'jelera/vim-javascript-syntax'
" Plug 'leafgarland/typescript-vim'

" Note: additional installation steps required with this plug. 
" See https://github.com/ycm-core/YouCompleteMe#windows
" For adding completion support for various languages.
" install.py is found in ~/.local/share/nvim/plugged/YouCompleteMe
"
" Note: Windows 10 adds python.exe as an alias to the Windows Store,
" making it so Neovim is unable to find the executable. Use the Windows
" settings page `Manage app execution aliases` to turn this off.
"
" Also run .ycm_extra_conf.py
" You can check for correct Python installation using :CheckHealth
" Plug 'ycm-core/YouCompleteMe'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" See :help deoplete-options for a list of configuration options. 
let g:deoplete#enable_at_startup = 1
