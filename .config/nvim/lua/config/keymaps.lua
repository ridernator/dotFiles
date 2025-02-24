vim.g.mapleader = " "

-- Enable relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 1
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

-- Primeagen's move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Trim whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]]
})

-- Enable search highlighting
vim.opt.hlsearch = true

-- vim.opt.cursorline = true

-- Turn on highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 500
    }
  end
})

vim.opt.virtualedit = "block"

-- Remap window moves
vim.keymap.set('n', '<C-Left>',  '<C-w>h')
vim.keymap.set('n', '<C-Down>',  '<C-w>j')
vim.keymap.set('n', '<C-Up>',    '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

-- Remap tab moves
vim.keymap.set('n', '<A-Left>',  ':tabprevious<CR>', {silent = true})
vim.keymap.set('n', '<A-Right>', ':tabnext<CR>', {silent = true})
vim.keymap.set('n', 't<Right>', ':tabmove +1<CR>', {silent = true})
vim.keymap.set('n', 't<Left>', ':tabmove -1<CR>', {silent = true})

-- Quick close
vim.keymap.set('n', 'Q', ':quit<CR>', {silent = true})
vim.keymap.set('n', '<C-q>', ':quitall<CR>', {silent = true})

-- Abandon git difftool
vim.keymap.set('n', 'dq', ':cquit<CR>', {silent = true})

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.mouse = ""

-- Save time writing std::
vim.keymap.set('i', '<C-s>', 'std::', {silent = true})

-- Autoclose braces
vim.keymap.set('i', '{<CR>', '{<CR><CR>}<Esc><Up>S', {silent = true})
