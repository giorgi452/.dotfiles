return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      options = {
        theme = 'horizon', -- You can change this to your preferred theme
      },
      sections = {
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename', 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      extensions = { 'fugitive' }
    }
  end,
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
}
