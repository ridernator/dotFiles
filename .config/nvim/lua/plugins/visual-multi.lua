return {
  "mg979/vim-visual-multi",

  lazy = false,

  config = function()
    vim.keymap.set("n", "<C-Down>", "")
    vim.keymap.set("n", "<C-Up>", "")
    vim.keymap.set("n", "<A-Up>", "<Plug>(VM-Add-Cursor-Up)", {silent = true})
    vim.keymap.set("n", "<A-Down>", "<Plug>(VM-Add-Cursor-Down)", {silent = true})
  end;
}
