return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local cg = require("nvim-treesitter.configs")

      cg.setup({
        ensure_installed = {
          "vim",
          "lua",
          "vimdoc",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "php",
          "asm",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
