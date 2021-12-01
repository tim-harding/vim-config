local nvim_tree = require("nvim-tree")

-- 0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_indent_markers = 1 

-- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_git_hl = 1 

-- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_add_trailing = 1 

--  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_group_empty = 1 

-- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
vim.g.nvim_tree_create_in_closed_folder = 0 

-- TODO: NvimTreeFindFile if closed, otherwise close. 
vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	":NvimTreeToggle<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>n",
	":NvimTreeFindFile<CR>",
	{ noremap = true }
)

-- this variable must be enabled for colors to be applied properly
vim.opt.termguicolors = true;
