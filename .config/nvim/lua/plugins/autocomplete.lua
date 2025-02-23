return {
  "saghen/blink.cmp",

  version = "*",

  dependencies = "rafamadriz/friendly-snippets",

  opts = {
    keymap = {
      preset = "super-tab"
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono"
    },

    signature = {
      enabled = true
    }
  }
}
