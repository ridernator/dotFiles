vim.pack.add({ 'https://github.com/hrsh7th/cmp-nvim-lsp' })

require('cmp_nvim_lsp').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
