local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	-- When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
	create_in_closed_folder = false,
	renderer = {
		-- Append a trailing slash to folder names
		add_trailing = false,
		highlight_git = true,
		--  0 by default, compact folders that only contain a single folder into one node in the file tree
		group_empty = true,
	}
})

-- TODO: NvimTreeFindFile if closed, otherwise close.
vim.api.nvim_set_keymap(
	"n",
	"<C-b>",
	":NvimTreeToggle<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	":NvimTreeFindFile<CR>",
	{ noremap = true }
)
