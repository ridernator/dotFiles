return {
    'neovim/nvim-lspconfig',

    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- For notifications
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
        'folke/neodev.nvim',
    }
}
