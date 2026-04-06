vim.pack.add({ 'https://github.com/rshkarin/mason-nvim-lint' })

local servers = {
  cpplint = {}
}

require('mason-nvim-lint').setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = false
}
