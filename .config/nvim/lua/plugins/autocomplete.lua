return {
  "ridernator/blink.cmp",

  branch = "not_in_word",

  build = "cargo build --release",

  dependencies = "rafamadriz/friendly-snippets",

  opts = {
    keymap = {
      preset = "super-tab"
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono"
    },

    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false
        }
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        update_delay_ms = 0,

        window = {
          border = "rounded"
        }
      },

      menu = {
        border = "rounded"
      }
    },

    signature = {
      window = {
        border = "rounded"
      },

      enabled = true
    },

    fuzzy = {
      implementation = "lua"
    }
  }
}
