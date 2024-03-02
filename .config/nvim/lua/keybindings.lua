-- Set mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable relative line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Trim whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    command = [[%s/\s\+$//e]]
})

-- Don't scroll all the way to top or bottom of screen
vim.o.scrolloff = 5

-- Disable search highlighting
vim.o.hlsearch = false

-- Turn on highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch',
                            timeout = 500 }
  end
})
