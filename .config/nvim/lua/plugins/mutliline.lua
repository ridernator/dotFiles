return {
    'mg979/vim-visual-multi',

    config = function()
        vim.keymap.set('n', '<C-S-Up>',   '<Plug>(VM-Add-Cursor-Up)')
        vim.keymap.set('n', '<C-S-Down>', '<Plug>(VM-Add-Cursor-Down)')
    end
}
