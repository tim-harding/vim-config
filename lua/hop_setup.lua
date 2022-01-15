local hop = require('hop')

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.api.nvim_set_keymap(
	"n",
	"<Leader>w",
	"<cmd>lua require('hop').hint_words()<CR>",
	{}
)
