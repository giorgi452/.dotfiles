-- Vim Customization
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Vim Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Mapping
vim.keymap.set("n", "<Leader><Leader>", ":nohlsearch<CR>", { desc = "Clear search highlighting" })
