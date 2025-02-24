return {
  "arnamak/stay-centered.nvim",

  lazy = false,

  init = function()
    vim.o.scrolloff = 1000
  end;

  opts = {
    allow_scroll_move = false,
  }
}
