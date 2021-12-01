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
	reload("configure_lualine")
	reload("configure_nvim_tree")
	reload("configure_nvim_cmp")
	reload("configure_auto_session")
	reload("configure_nvim_autopairs")
	reload("configure_kommentary")
	reload("treesitter")
	reload("barbar")
	reload("indent_blankline_setup")
end

return config
