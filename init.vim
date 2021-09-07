" ----------------------------------------------------------------
" Vim sensible
" ----------------------------------------------------------------

filetype plugin indent on
syntax enable

set autoindent
set backspace=indent,eol,start
set smarttab

set nrformats-=octal

set incsearch

set laststatus=2
set ruler
set wildmenu

set sidescrolloff=5
set display+=lastline

set encoding=utf-8

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Delete comment character when joining commented lines
set formatoptions+=j 

setglobal tags-=./tags tags-=./tags; tags^=./tags;

set autoread

set tabpagemax=50
set viminfo^=!

set sessionoptions-=options
set viewoptions-=options

set t_Co=16

runtime! macros/matchit.vim



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


call plug#end()



" --------------------------------------------------------
" General setup
" --------------------------------------------------------

" Allow switching buffers without saving
set hidden

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
" set guifont=Cascadia\ Mono:h16

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

set relativenumber

" Neovide
let g:neovide_cursor_animation_length = 0

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

let mapleader = " "

" Easier buffer switching
" map <leader><leader> <C-^>

" Use normal paste command
imap <C-v> <Esc>"+pa

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
