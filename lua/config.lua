-- Escapes codes such as <C-n> and <Tab>
function _G.t(string)
	-- https://neovim.io/doc/user/api.html#nvim_replace_termcodes()
	return vim.api.nvim_replace_termcodes(string, true, true, true)
end

local function reload(module_name)
	package.loaded[module_name] = nil
	local module = require(module_name)
	module()
end

local function config()
	reload("general")
	reload("plugins")
	reload("keybindings")
	reload("lsp")
end

return config
