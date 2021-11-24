-- Operator-pending would be, for example, when you've typed 
-- 'y' before executing 'yw'
--
-- Select mode is rarely used for anything other than snippet engines
--
-- More details here: https://github.com/nanotee/nvim-lua-guide#defining-mappings
local Mode = {
	-- Normal, visual, select, operator-pending
	-- :map
	all = "",
	-- :nmap
	normal = "n",
	-- :vmap
	visual_and_select = "v",
	select_ = "s",
	visual = "x",
	operator_pending = "o",
	-- map!
	insert_and_command = "!",
	-- imap
	insert = "i",
	insert_and_command_and_lang_arg = "l",
	command_line = "c",
	terminal = "t",
}

-- If `expr = true`, the command evaluates to some
-- string that then is executed. This allows for 
-- different mapping behaviors based on context.
local remap_settings = {
	noremap = true,
	silent = true,
}

-- Do I need to return a function from my modules and 
-- call it in order to get hot-reload? Why does re-sourcing
-- not update my key bindings?

-- Easier buffer switching
vim.api.nvim_set_keymap(
	Mode.normal, 
	"<Leader><Leader>",
	"<C-^>",
	remap_settings
)

-- Grow pane size
vim.api.nvim_set_keymap(
	Mode.normal,
	"<Leader>+",
	":exe \"resize \" . (winheight(0) * 3/2)<CR>",
	remap_settings
)

-- Shrink pane size
vim.api.nvim_set_keymap(
	Mode.normal,
	"<Leader>-",
	":exe \"resize \" . (winheight(0) * 2/3)<CR>",
	remap_settings
)

-- Move pane down
vim.api.nvim_set_keymap(
	Mode.normal,
	"<Leader><Down>",
	"<C-W><C-J>",
	remap_settings
)

-- Move pane up
vim.api.nvim_set_keymap(
	Mode.normal,
	"<Leader><Up>",
	"<C-W><C-K>",
	remap_settings
)

-- Move pane left
vim.api.nvim_set_keymap(
	Mode.normal,
	"<Leader><Left>",
	"<C-W><C-H>",
	remap_settings
)

-- Move pane right
vim.api.nvim_set_keymap(
	Mode.normal,
	"<Leader><Right>",
	"<C-W><C-L>",
	remap_settings
)
