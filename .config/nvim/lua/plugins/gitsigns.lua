return {
  "lewis6991/gitsigns.nvim",

  init = function()
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>', {silent = true})
    vim.keymap.set('n', 'gB', ':Gitsigns blame<CR>', {silent = true})
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>', {silent = true})
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>', {silent = true})
    vim.keymap.set('n', 'ha', ':Gitsigns stage_hunk<CR>', {silent = true})
    vim.keymap.set('n', 'hu', ':Gitsigns undo_stage_hunk<CR>', {silent = true})
    vim.keymap.set('n', 'hr', ':Gitsigns reset_hunk<CR>', {silent = true})
    vim.keymap.set('n', 'he', ':Gitsigns setqflist<CR>', {silent = true})
  end
}
