-- Enable relative line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Primeagen's move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 500
        }
    end
})

-- Remap window moves
vim.keymap.set('n', '<C-Left>',  '<C-w>h')
vim.keymap.set('n', '<C-Down>',  '<C-w>j')
vim.keymap.set('n', '<C-Up>',    '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

-- Remap tab moves
vim.keymap.set('n', '<A-Left>',  ':tabprevious<cr>')
vim.keymap.set('n', '<A-Right>', ':tabnext<cr>')

-- Window splitting
-- vim.keymap.set('n', '<C-\\|>', '<C-w>s')
-- vim.keymap.set('n', '<C-_>', '<C-w>v')
