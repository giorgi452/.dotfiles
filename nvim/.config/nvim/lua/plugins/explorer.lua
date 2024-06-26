return {
  "prichrd/netrw.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('netrw').setup({
      -- Put your configuration here, or leave the object empty to take the default
      -- configuration.
      icons = {
        symlink = ' ', -- Symlink icon (directory and file)
        directory = ' ', -- Directory icon
        file = ' ', -- File icon
      },
      use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
      mappings = {}, -- Custom key mappings
    })
    vim.keymap.set('n', '<leader>n', ':Ex<CR>', {desc = "Toggle File Tree"})
  end,
}
