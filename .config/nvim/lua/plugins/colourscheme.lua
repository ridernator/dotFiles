return {
  "ellisonleao/gruvbox.nvim",

  name = "gruvbox",

  -- Set priority high so colourscheme gets loaded first
  priority = 1000,

  init = function()
    vim.cmd.colorscheme("gruvbox")

    vim.cmd.highlight('Normal guibg=none')
    vim.cmd.highlight('TabLine guibg=none')
    vim.cmd.highlight('TabLineFill guibg=none')
    vim.cmd.highlight('TabLineSel guibg=none')
  end
}
