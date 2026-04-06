vim.pack.add({ 'https://github.com/williamboman/mason-lspconfig.nvim' })

local servers = {
  jdtls = {},
  bashls = {},
  clangd = {},
  lua_ls = {
    settings = {
      Lua = {
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim",
					},
				},
				hint = { enable = true },
      }
    }
  },
  pylsp = {},
  lemminx = {},
  vimls = {}
}

require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = false
}

for server_name, config in pairs(servers) do
	vim.lsp.config(server_name, config)
end
