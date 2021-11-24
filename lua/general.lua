-- For information on setting this all up:
-- https://sharksforarms.dev/posts/neovim-rust/

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.opt.completeopt = {
	"menuone",
	"noinsert",
	"noselect",
}

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append("c")

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.opt.signcolumn = "yes"

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.opt.updatetime = 300

-- Note: Much of Vim Sensible is included by Neovim defaults. See
-- https://github.com/neovim/neovim/issues/2676

-- Always keep at least 5 screen columns 
-- to the left and to the right of the cursor if 'nowrap' is set.  
vim.opt.sidescrolloff = 5

-- set encoding=utf-8
-- Set text encoding to UTF-8 rather than ASCII
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Makes `set :list`, which enables visible whitespace, prettier
vim.opt.listchars = {
	extends = "›",
	precedes = "‹",
	nbsp = "·",
	trail = "·",
	eol = "↲",
	tab = "» ",
}

-- Removes window- or buffer-local options from being affected
-- by the :mkview command
vim.opt.viewoptions:remove("options")

-- Enable the use of the mouse in all modes
vim.opt.mouse = "a"

-- Allow switching buffers without saving
vim.opt.hidden = true

-- Turns on spell checking. 
-- More information at :spell-quickstart
-- :setlocal spell spelllang=en_us

-- Forces a gap between the cursor and the top and bottom of the screen
vim.opt.scrolloff = 3

-- Turns off the highlight left behind by searches
vim.opt.hlsearch = false

-- Only wrap text at word boundaries
vim.opt.linebreak = true

-- Embiggen the undo history
vim.opt.history = 1024

-- Turn on line numbering
vim.opt.number = true

-- Search case-insensitive unless the term includes a capital
vim.opt.ignorecase = true

-- Don't convert tabs to spaces by default
vim.opt.expandtab = false

-- Use spaces for tabs if the rest of the file already does
vim.opt.copyindent = true

-- When changing a line's indentation, try to preserve the tab or space pattern
vim.opt.preserveindent = true

-- Preserve indent when moving to a new line
vim.opt.autoindent = true

-- Affects the number of spaces per tab when indenting with spaces
-- Backspace will delete a full tab character rather than a single space, good
-- for Python. 
vim.opt.softtabstop = 0

-- Display width of a tab character
vim.opt.tabstop = 4

-- Affects the behavior of auto-indent and shift commands
vim.opt.shiftwidth = 4

-- Highlights the line the cursor is on
vim.opt.cursorline = true

-- Give lines a little more breathing room
vim.opt.linespace = 2

-- Support :find
vim.opt.path:append("**")

vim.opt.relativenumber = true

vim.g.mapleader = ","

vim.cmd("colorscheme nord")

-- Configuration: Choose a statusline that makes 
-- configuring this with Lua easy to understand
-- vim.g.lightline = '{ "colorscheme": "nord" }'

-- Note: Windows 10 adds python.exe as an alias to the Windows Store,
-- making it so Neovim is unable to find the executable. Use the Windows
-- settings page `Manage app execution aliases` to turn this off. 
-- We need a python install with the neovim package installed with pip. 
vim.g.python3_host_prog = "C:/Windows/py.exe"
vim.g.netrw_banner = 0
