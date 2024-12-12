return {
  {
    'prichrd/netrw.nvim',
    config = function()
      require("netrw").setup({
        -- File icons to use when `use_devicons` is false or if
        -- no icon is found for the given file type.
        icons = {
          symlink = '',
          directory = '',
          file = '',
        },
        -- Uses mini.icon or nvim-web-devicons if true, otherwise use the file icon specified above
        use_devicons = true,
        mappings = {
          -- Function mappings receive an object describing the node under the cursor
          ['p'] = function(payload) print(vim.inspect(payload)) end,
          -- String mappings are executed as vim commands
          ['<Leader>p'] = ":echo 'hello world'<CR>",
        },
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 32,
        }
      })
      vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<CR>", {})
      vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
  }
}
