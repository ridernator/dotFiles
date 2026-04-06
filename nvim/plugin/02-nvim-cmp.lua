vim.pack.add({ 'https://github.com/hrsh7th/nvim-cmp' })

local cmp = require('cmp')

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }
  },

  sources = {
    { name = "nvim_lsp" },
  }
}
