  -- nvim-tree
return {
    'nvim-tree/nvim-tree.lua',

    -- dependencies = {
    --     'nvim-tree/nvim-web-devicons'
    -- },

    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.keymap.set({ 'n', 'v', 'i' }, '<C-f>', ':NvimTreeToggle<CR>', { desc = 'Toggle nvim-tree' })
        vim.api.nvim_create_autocmd("QuitPre", {
            callback = function()
                local tree_wins = {}
                local floating_wins = {}
                local wins = vim.api.nvim_list_wins()

                for _, w in ipairs(wins) do
                    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))

                    if bufname:match('NvimTree_') ~= nil then
                        table.insert(tree_wins, w)
                    end

                    if vim.api.nvim_win_get_config(w).relative ~= '' then
                        table.insert(floating_wins, w)
                    end
                end

                if 1 == #wins - #floating_wins - #tree_wins then
                    -- Should quit, so we close all invalid windows.
                    for _, w in ipairs(tree_wins) do
                        vim.api.nvim_win_close(w, true)
                    end
                end
            end
        })

        require('nvim-tree').setup({
            sort = {
                sorter = 'name'
            },

            view = {
                width = 30,
                number = true,
                relativenumber = true
            },

            renderer = {
                group_empty = true,
                highlight_opened_files = 'name',
                icons = {
                    symlink_arrow = " -> ",
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = false,
                        git = false,
                        modified = true,
                        diagnostics = false,
                        bookmarks = false
                    },
                    glyphs = {
                        symlink = "@"
                    }
                }
            },

            filters = {
                dotfiles = false,
                git_ignored = false
            },

            tab = {
                sync = {
                    open = true,
                    close = true
                }
            }
        })
    end
}
