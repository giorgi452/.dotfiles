return {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
    config = function()
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
        vim.keymap.set("n", "<leader>us", vim.cmd.UndotreeShow, { desc = "Show Undotree" })
        vim.keymap.set("n", "<leader>uh", vim.cmd.UndotreeHide, { desc = "Hide Undotree" })
        vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus, { desc = "Focus Undotree" })
    end,
}
