return {
    {
        "folke/ts-comments.nvim",
        opts = {},
        lazy = false,
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
            vim.keymap.set('n', "<leader>ft", ":TodoTelescope<CR>", { desc = "Todo Telescope" })
        end
    }
}
