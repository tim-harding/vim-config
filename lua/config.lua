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
