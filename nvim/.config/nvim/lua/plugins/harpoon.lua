return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>', { desc = "Harpoon add file" })
        vim.keymap.set("n", "<leader>ht", ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
            { desc = "Harpoon toggle quick menu" })
        vim.keymap.set("n", "<leader>fh", ':Telescope harpoon marks<CR>', { desc = "Toggle Harpoon with Telescope" })
        vim.keymap.set("n", "<leader>hn", ':lua require("harpoon.ui").nav_next()<CR>', { desc = "Navigate to next file" })
        vim.keymap.set("n", "<leader>hp", ':lua require("harpoon.ui").nav_prev()<CR>',
            { desc = "Navigate to previous file" })
    end,
}
