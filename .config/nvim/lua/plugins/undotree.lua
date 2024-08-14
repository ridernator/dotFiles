return {
    "jiaoshijie/undotree",

    dependencies = "nvim-lua/plenary.nvim",

    config = true,

    keys = {
        {
            "gu", "<cmd>lua require('undotree').toggle()<CR>"
        }
    }
}
