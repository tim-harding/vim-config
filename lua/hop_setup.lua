local hop = require('hop')

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.api.nvim_set_keymap(
	"n",
	"j",
	"<cmd>lua require('hop').hint_words()<CR>",
	{
		noremap = true,
		silent = true,
	}
)

vim.api.nvim_set_keymap(
	"n",
	"s",
	"<cmd>lua require('hop').hint_char2()<CR>",
	{
		noremap = true,
		silent = true,
	}
)
