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

-- Enable search highlighting
vim.o.hlsearch = true

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

-- Creating splits
vim.keymap.set('n', '-', ':split<cr>')
vim.keymap.set('n', '\\', ':vsplit<cr>')

-- vim.opt_global.updatetime=1000
-- vim.api.nvim_create_autocmd(
--     "CursorHold",
--     {
--         pattern = {"*"},
--         callback = function()
--             vim.lsp.buf.document_highlight()
--         end
--     }
-- )
--
-- vim.api.nvim_create_autocmd(
--     "CursorHoldI",
--     {
--         pattern = {"*"},
--         callback = function()
--             vim.lsp.buf.document_highlight()
--         end
--     }
-- )
--
-- vim.api.nvim_create_autocmd(
--     "CursorMoved",
--     {
--         pattern = {"*"},
--         callback = function()
--             vim.lsp.buf.clear_references()
--         end
--     }
-- )

vim.keymap.set('n', 'gR', ':lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>')
