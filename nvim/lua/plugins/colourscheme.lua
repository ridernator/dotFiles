return {
  "ellisonleao/gruvbox.nvim",

  name = "gruvbox",

  -- Set priority high so colourscheme gets loaded first
  priority = 1000,

  init = function()
    vim.cmd.colorscheme("gruvbox")

    vim.cmd.highlight("Normal guibg=none")
    vim.cmd.highlight("TabLine guibg=none")
    vim.cmd.highlight("TabLineFill guibg=none")
    vim.cmd.highlight("TabLineSel guibg=none")
    vim.cmd.highlight("BlinkCmpScrollBarThumb guibg=white guifg=none")
    vim.cmd.highlight("BlinkCmpMenu guibg=none guifg=white")
    vim.cmd.highlight("BlinkCmpMenuBorder guibg=none guifg=white")
    vim.cmd.highlight("BlinkCmpMenuSelection guibg=none guifg=green")
    vim.cmd.highlight("BlinkCmpDoc guibg=none guifg=white")
    vim.cmd.highlight("BlinkCmpDocBorder guibg=none guifg=white")
    vim.cmd.highlight("BlinkCmpDocSeparator guibg=none guifg=white")
    vim.cmd.highlight("BlinkCmpDocSelection guibg=none guifg=green")
    vim.cmd.highlight("BlinkCmpSignatureHelp guibg=none guifg=white")
    vim.cmd.highlight("BlinkCmpSignatureHelpBorder guibg=none guifg=white")
    vim.cmd.highlight("BlinkCmpSignatureHelpSelection guibg=none guifg=green")
    vim.cmd.highlight("SignColumn guibg=none guifg=white")
    vim.cmd.highlight("CursorLineNr guibg=none guifg=white gui=bold")
    vim.cmd.highlight("DiagnosticSignError guibg=none guifg=red gui=bold")
    vim.cmd.highlight("DiagnosticSignWarn guibg=none guifg=orange gui=bold")
    vim.cmd.highlight("DiagnosticSignInfo guibg=none guifg=white gui=bold")
    vim.cmd.highlight("DiagnosticSignHint guibg=none guifg=white gui=bold")
  end
}
