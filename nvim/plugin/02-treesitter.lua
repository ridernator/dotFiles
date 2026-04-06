vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require("nvim-treesitter").setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = {
    enable = true,
  },
  -- ensure these language parsers are installed
  ensure_installed = {
    "yaml",
    "xml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "java",
    "cpp",
    "c",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "c",
  }
})
