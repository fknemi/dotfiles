local cmp = require("cmp_nvim_lsp")
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.signcolumn = "number"
vim.o.statuscolumn = "%s %l %r  "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>mm", vim.cmd.MCstart, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tk", vim.cmd.NvimTreeFocus, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tp", require'telescope'.extensions.projects.projects, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ww", require'workspaces'.open, {noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>wll", require'workspaces'.list, {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wll', ':WorkspacesList<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sx', ':w!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qq', ':q!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })




