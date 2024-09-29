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
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      -- You don't need to set any of these options.
      -- IMPORTANT!: this is only a showcase of how you can set default options!
      require("telescope").setup {
        extensions = {
          file_browser = {
            hijack_netrw = true,
            find_command = { "ls", "-a", "-1", "--group-directories-first" }
          },
        },
      }
      -- To get telescope-file-browser loaded and working with telescope,
      -- you need to call load_extension, somewhere after setup function:
      require("telescope").load_extension "file_browser"

      vim.keymap.set("n", "<space>n", ":Telescope file_browser<CR>", { desc = "File Browser" })

      -- open file_browser with the path of the current buffer
      vim.keymap.set("n", "<space>n", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "File Browser" })

      -- Alternatively, using lua API
      vim.keymap.set("n", "<space>n", function()
        require("telescope").extensions.file_browser.file_browser()
      end, { desc = "File Browser" })
    end
  }
}
