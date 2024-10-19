-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.python3_host_prog = "python"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

vim.opt.inccommand = "split"
vim.opt.smarttab = true
vim.opt.wrap = true
