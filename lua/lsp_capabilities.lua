local cmp = require('cmp_nvim_lsp')
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp.update_capabilities(client_capabilities)
return capabilities
