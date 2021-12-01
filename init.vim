" Information about using Lua as a configuration language:
" https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

lua<<EOF
package.loaded["config"] = nil
local config = require "config" 
config()
EOF

" Set the built-in shell to use Powershell on Windows
" let &shell = has('win32') ? 'powershell' : 'pwsh'
" set shellquote= shellpipe=\| shellxquote=
" set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
" set shellredir=\|\ Out-File\ -Encoding\ UTF8

" Source vim configuration upon save
augroup vimrc     
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END
