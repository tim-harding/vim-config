set nocompatible
filetype plugin on
runtime macros/matchit.vim

set hlsearch!
set history=200
set number
syntax on
colorscheme onedark

call plug#begin('~/.local/share/nvim/plugged')
Plug 'https://github.com/prabirshrestha/vim-lsp.git'
call plug#end()


if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif
