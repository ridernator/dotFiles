return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  init = function ()
    require("lualine").setup({
      options = {
        theme = "rider"
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1
          }
        }
      },
      -- tabline = {
      --   lualine_a = {
      --     {
      --       'tabs',
      --       tab_max_length = 40,
      --       max_length = vim.opt.columns,
      --       mode = 1,
      --       path = 1,
      --     }
      --   }
      -- }
    })
  end
}
