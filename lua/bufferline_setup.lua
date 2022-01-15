vim.opt.termguicolors = true
local bufferline = require("bufferline")


bufferline.setup {
  options = {
  	buffer_close_icon = "",
    close_command = "bdelete! %d",
    middle_mouse_command = "bdelete! %d",
    right_mouse_command = nil,
    separator_style = "thick",
  }
}

vim.api.nvim_set_keymap(
	"n",
	"<C-Right>",
	":BufferLineCycleNext<CR>",
	{
		noremap = true,
		silent = true,
	}
)

vim.api.nvim_set_keymap(
	"n",
	"<C-Left>",
	":BufferLineCyclePrev<CR>",
	{
		noremap = true,
		silent = true,
	}
)

vim.api.nvim_set_keymap(
	"n",
	"<CS-Right>",
	":BufferLineMoveNext<CR>",
	{
		noremap = true,
		silent = true,
	}
)

vim.api.nvim_set_keymap(
	"n",
	"<CS-Left>",
	":BufferLineMovePrev<CR>",
	{
		noremap = true,
		silent = true,
	}
)
