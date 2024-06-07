return {
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
		dap.configurations.asm = {
			type = "assembly",
			request = "launch",
			program = "${file}",
			nasmPath = function()
				return "/usr/bin/nasm"
			end,
		}
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {desc="Toggle Breakpoint"})
		vim.keymap.set("n", "<leader>dc", dap.continue, {desc = "Continue Debugging"})
	end,
}
