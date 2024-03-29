local cmp = require('cmp')

local function expand(args)
    require('luasnip').lsp_expand(args.body)
end

cmp.setup({
    snippet = {
      	expand = expand,
    },
    mapping = {
      	['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      	['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      	['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      	['<C-e>'] = cmp.mapping({
        	i = cmp.mapping.abort(),
        	c = cmp.mapping.close(),
      	}),
      	['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      	{ name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
      	{ name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    sources = {
      	{ name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      	{ name = 'path' }
    }, {
      	{ name = 'cmdline' }
    })
})
