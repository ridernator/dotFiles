return {
  "ibhagwan/fzf-lua",

  dependencies = { "junegunn/fzf", build = "./install --bin" },

  init = function()
    require("fzf-lua").setup({})

    vim.keymap.set("n", "<c-p>", require('fzf-lua').git_files, { desc = "Fzf Files" })
    vim.keymap.set("n", "<c-f>", require('fzf-lua').files, { desc = "Files" })
    vim.keymap.set("n", "<c-g>", require('fzf-lua').grep, { desc = "Rg Files" })
  end
}
