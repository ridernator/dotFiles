vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

vim.keymap.set("n", "<c-p>", require('fzf-lua').git_files, { silent = true })
vim.keymap.set("n", "<c-f>", require('fzf-lua').files,     { silent = true })
vim.keymap.set("n", "<c-g>", require('fzf-lua').grep,      { silent = true })
