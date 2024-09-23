return {
    'mg979/vim-visual-multi',

    config = function()
        vim.cmd("highlight! VM_Mono guibg=Grey60 guifg=Black gui=NONE")

        vim.keymap.set('n', '<C-S-Up>',   '<Plug>(VM-Add-Cursor-Up)')
        vim.keymap.set('n', '<C-S-Down>', '<Plug>(VM-Add-Cursor-Down)')
    end
}
