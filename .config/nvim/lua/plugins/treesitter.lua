return {
  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "java", "python", "lua", "markdown", "markdown_inline", "vim", "vimdoc" },

        auto_install = true,

        sync_install = false,

        ignore_install = {},

        modules = {},

        highlight = {
          enable = true
        },

        textobjects = {
          select = {
            enable = true,

            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" }
            },

            selection_modes = {
              ['@parameter.outer'] = 'v',
              ['@function.outer'] = 'V',
              ['@class.outer'] = '<c-v>'
            },

            include_surrounding_whitespace = true
          },

          move = {
            enable = true,

            set_jumps = true,

            goto_next_start = {
              ["]m"] = "@function.outer",
            },

            goto_previous_start = {
              ["[m"] = "@function.outer",
            },
          }
        }
      }

      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects"
  }
}
