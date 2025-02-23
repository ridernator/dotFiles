return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} }
  },

  init = function()
    require("nvim-tree").setup()

    vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })
  end
}
