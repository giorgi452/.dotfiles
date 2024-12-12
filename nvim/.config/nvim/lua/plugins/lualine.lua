return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
      },
    })
  end,
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
}
