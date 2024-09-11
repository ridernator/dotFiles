require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
    jdtls = {},
    bashls = {},
    clangd = {},
    cmake = {},
    lua_ls = {},
    pylsp = {},
    vimls = {}
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}

vim.keymap.set('n', 'gR', ':lua vim.lsp.buf.rename()<CR>', {silent = true})
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {silent = true})
vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', {silent = true})
vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', {silent = true})
vim.keymap.set('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', {silent = true})
