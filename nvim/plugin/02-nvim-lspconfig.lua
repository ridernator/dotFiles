vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

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

vim.keymap.set('n', 'gD', function()
  vim.api.nvim_command('normal mz')
  vim.api.nvim_command(':tabnew %')
  vim.api.nvim_command('normal `z')
  vim.api.nvim_command('normal gd')
end, {silent = true})

vim.keymap.set('n', 'g<C-d>', function()
  vim.api.nvim_command('normal mz')
  vim.api.nvim_command(':vsplit %')
  vim.api.nvim_command('normal `z')
  vim.api.nvim_command('normal gd')
end, {silent = true})

vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', {silent = true})

vim.keymap.set('n', 'gI', function()
  vim.api.nvim_command('normal mz')
  vim.api.nvim_command(':tabnew %')
  vim.api.nvim_command('normal `z')
  vim.api.nvim_command('normal gi')
end, {silent = true})

vim.keymap.set('n', 'g<C-i>', function()
  vim.api.nvim_command('normal mz')
  vim.api.nvim_command(':vsplit %')
  vim.api.nvim_command('normal `z')
  vim.api.nvim_command('normal gi')
end, {silent = true})

vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', {silent = true})

vim.keymap.set('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', {silent = true})

vim.keymap.set('n', 'ge', ':lua vim.diagnostic.setqflist({severity = {min = vim.diagnostic.severity.ERROR }})<CR>', {silent = true})

vim.keymap.set('n', 'gw', ':lua vim.diagnostic.setqflist({severity = {min = vim.diagnostic.severity.WARN }})<CR>', {silent = true})

vim.keymap.set("n", "gh", function()
  local util = require 'lspconfig.util'

  local method_name = 'textDocument/switchSourceHeader'
  local client = vim.lsp.get_clients({ bufnr = 0, name = 'clangd' })[1]

  if not client then
    return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
  end

  local params = vim.lsp.util.make_text_document_params(0)
  client:request(method_name, params, function(err, result)
    if err then
      error(tostring(err))
    end

    if not result then
      vim.notify('corresponding file cannot be determined')


      return
    end

   vim.cmd.edit(vim.uri_to_fname(result))
 end, 0)
end, {silent = true})

vim.keymap.set("n", "gH", function()
  vim.api.nvim_command('normal mz')
  vim.api.nvim_command(':tabnew %')
  vim.api.nvim_command('normal `z')
  vim.api.nvim_command('normal gh')
end, {silent = true})

vim.keymap.set("n", "g<C-h>", function()
  vim.api.nvim_command('normal mz')
  vim.api.nvim_command(':vsplit %')
  vim.api.nvim_command('normal `z')
  vim.api.nvim_command('normal gh')
end, {silent = true})

vim.keymap.set('n', 'go', function()
  if vim.diagnostic.config().virtual_text then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end, {silent = true})
