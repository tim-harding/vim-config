local function reload(module_name)
	package.loaded[module_name] = nil
	require(module_name)
end

local function config()
	reload("general")
	reload("keybindings")
	reload("plugins")
	reload("hop_setup")
	reload("nvim_autopairs_setup")

	if vim.fn.exists("g:vscode") == 1 then
		reload("easymotion_setup")
		return
	end

	reload("nord_setup")
	reload("treesitter")

	reload("nvim_cmp_setup")
	reload("lsp_clangd")

	reload("kommentary_setup")
	reload("lualine_setup")
	reload("indent_blankline_setup")
	reload("gitsigns_setup")
	reload("nvim_tree_setup")
end

return config
