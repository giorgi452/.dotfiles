return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.pint,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Buffer"})
	end,
}
