-- Vim Customization
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smartindent")
vim.cmd("set termguicolors")

vim.opt.guicursor = ""

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "112"

-- Vim Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Mapping
vim.keymap.set("n", "<Leader><Leader>", ":nohlsearch<CR>", { desc = "Clear search highlighting" })
vim.keymap.set("n", "<Leader>s", ":wa<CR>", { desc = "Save all files" })
