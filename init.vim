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
set cursorline

" :help key-notation
" :help map-overview
" noremap is non-recursive remapping
" map  - All modes
" map! - Insert and command
" imap - Insert
" nmap - Normal
" cmap - Command

" Map Ctrl-Backspace to delete the previous word
map! <C-BS> <C-W>

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
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

syntax on
colorscheme onedark

let g:netrw_banner = 0

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
Plug 'Shougo/deoplete-clangx'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'powershell -executionpolicy bypass -File install.ps1' }
Plug 'OmniSharp/omnisharp-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

call deoplete#custom#option('sources', {
	\ 'cs': ['omnisharp'],
	\})

" For Omnisharp
filetype indent plugin on

" Use Roslyn stdio server instead of HTTP
let g:OmniSharp_server_stdio = 1



""""""""""""""" For Language Client 

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
"" javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"" 'python': ['/usr/local/bin/pyls'],

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

""""""""""""""""""




" See :help deoplete-options for a list of configuration options. 
let g:deoplete#enable_at_startup = 1
