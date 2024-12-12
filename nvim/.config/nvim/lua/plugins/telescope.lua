return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live Grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require('telescope').load_extension('harpoon')
      require("telescope").load_extension("ui-select")
    end,
  },
}
