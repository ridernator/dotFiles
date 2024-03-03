-- Comment code with "gc"
return {
    'numToStr/Comment.nvim',

    opts = {
        toggler = {
            -- Line-comment toggle keymap
            line = '<C-/>',

            -- Block-comment toggle keymap
            block = '<C-S-/>'
        },

        opleader = {
            -- Line-comment keymap
            line = '<C-/>',

            --Block-comment keymap
            block = '<C-S-/>'
        },

        mappings = {
            basic = true,
            extra = false
        }
    }
}
