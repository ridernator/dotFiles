return {
  "mg979/vim-visual-multi",

  lazy = false,

  init = function()
    vim.g.VM_default_mappings = 0
    vim.keymap.set("n", "<c-s-Up>", "<Plug>(VM-Add-Cursor-Up)", {silent = true})
    vim.keymap.set("n", "<c-s-Down>", "<Plug>(VM-Add-Cursor-Down)", {silent = true})
  end;
}
