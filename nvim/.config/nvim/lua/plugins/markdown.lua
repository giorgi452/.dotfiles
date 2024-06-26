return {
  'MeanderingProgrammer/markdown.nvim',
  as = 'render-markdown',   -- Only needed if you have another plugin named markdown.nvim
  after = { 'nvim-treesitter' },
  config = function()
    require('render-markdown').setup({})
  end,
}
