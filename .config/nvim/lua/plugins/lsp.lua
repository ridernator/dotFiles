return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",

    -- For notifications
    "j-hui/fidget.nvim",
  },

  init = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
      jdtls = {},
      bashls = {},
      clangd = {},
      cmake = {},
      lua_ls = {},
      pylsp = {},
      lemminx = {},
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

    -- mason_lspconfig.setup_handlers {
    --   function(server_name)
    --     require('lspconfig')[server_name].setup {
    --       capabilities = capabilities,
    --       on_attach = on_attach,
    --       settings = servers[server_name],
    --       filetypes = (servers[server_name] or {}).filetypes,
    --     }
    --   end
    -- }

    vim.diagnostic.config({
      float = true,
      severity_sort = false,
      signs = true,
      underline = false,
      update_in_insert = true,
      virtual_text = true
    })

    vim.keymap.set("n", "gR", function()
      vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
        callback = function()
          local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
          vim.api.nvim_feedkeys(key, "c", false)
          vim.api.nvim_feedkeys("0C", "n", false)
          return true
        end,
      })
      vim.lsp.buf.rename()
    end, {silent = true})

    vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {silent = true})

    vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', {silent = true})

    vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', {silent = true})

    vim.keymap.set('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', {silent = true})

    vim.keymap.set('n', 'gh', ':ClangdSwitchSourceHeader<CR>', {silent = true})

    vim.keymap.set("n", "gH", function()
      local util = require 'lspconfig.util'

      local method_name = 'textDocument/switchSourceHeader'
      local client = vim.lsp.get_clients({ bufnr = 0, name = 'clangd' })[1]
      if not client then
        return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
      end
      local params = vim.lsp.util.make_text_document_params(0)
      client.request(method_name, params, function(err, result)
        if err then
          error(tostring(err))
        end
        if not result then
          vim.notify('corresponding file cannot be determined')
          return
        end
        vim.cmd.tabedit(vim.uri_to_fname(result))
      end, 0)
    end, {silent = true})

    vim.keymap.set("n", "g<C-h>", function()
      local util = require 'lspconfig.util'

      local method_name = 'textDocument/switchSourceHeader'
      local client = vim.lsp.get_clients({ bufnr = 0, name = 'clangd' })[1]
      if not client then
        return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
      end
      local params = vim.lsp.util.make_text_document_params(0)
      client.request(method_name, params, function(err, result)
        if err then
          error(tostring(err))
        end
        if not result then
          vim.notify('corresponding file cannot be determined')
          return
        end
        vim.cmd("vsplit")
        vim.cmd.edit(vim.uri_to_fname(result))
      end, 0)
    end, {silent = true})

    vim.keymap.set('n', 'go', function()
      if vim.diagnostic.config().virtual_text then
        vim.diagnostic.config({ virtual_text = false })
      else
        vim.diagnostic.config({ virtual_text = true })
      end
    end)
  end
}
