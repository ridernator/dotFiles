return {
  "ibhagwan/fzf-lua",

  dependencies = { "junegunn/fzf", build = "./install --bin" },

  init = function()
    require("fzf-lua").setup({})

    vim.keymap.set("n", "<leader><leader>", require('fzf-lua').git_files, { desc = "Fzf Files" })
    vim.keymap.set("n", "<leader>p", require('fzf-lua').files, { desc = "Files" })
    vim.keymap.set("n", "<leader>f", require('fzf-lua').grep, { desc = "Rg Files" })
  end
}
