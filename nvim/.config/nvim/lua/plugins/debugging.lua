return {
    {
        'epheien/termdbg'
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "leoluz/nvim-dap-go",
            "theHamsta/nvim-dap-virtual-text",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            require("dap-go").setup()
            require("nvim-dap-virtual-text").setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>dt", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue Debugging" })
            vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
            vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Step Over" })
            vim.keymap.set("n", "<leader>du", function() dap.step_out() end, { desc = "Step Out" })
        end,
    }
}
