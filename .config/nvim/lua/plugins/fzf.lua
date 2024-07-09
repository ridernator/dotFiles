return {
    "ibhagwan/fzf-lua",

    dependencies = { "junegunn/fzf", build = "./install --bin" },

    config = function()
        require("fzf-lua").setup({})

        vim.keymap.set("n", "<c-p>", require('fzf-lua').git_files, { desc = "Fzf Files" })
        vim.keymap.set("n", "<c-f>", require('fzf-lua').grep, { desc = "Rg Files" })
    end
}
