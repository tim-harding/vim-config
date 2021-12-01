-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd

local lspconfig = require("lspconfig")
local capabilities = require("lsp_capabilities")

-- Note: Always include capabilities for new language servers
lspconfig.clangd.setup({
	capabilities = capabilities
})
