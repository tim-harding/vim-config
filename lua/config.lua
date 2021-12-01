-- Escapes codes such as <C-n> and <Tab>
function _G.t(string)
	-- https://neovim.io/doc/user/api.html#nvim_replace_termcodes()
	return vim.api.nvim_replace_termcodes(string, true, true, true)
end

local function reload(module_name)
	package.loaded[module_name] = nil
	require(module_name)
end

local function config()
	reload("general")
	reload("plugins")
	reload("keybindings")
	reload("lsp_clangd")
	reload("lualine_setup")
	reload("nvim_tree_setup")
	reload("nvim_cmp_setup")
	reload("auto_session_setup")
	reload("nvim_autopairs_setup")
	reload("kommentary_setup")
	reload("treesitter")
	reload("barbar_setup")
	reload("indent_blankline_setup")
	reload("gitsigns_setup")
end

return config
