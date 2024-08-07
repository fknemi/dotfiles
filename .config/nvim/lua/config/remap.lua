local cmp = require("cmp_nvim_lsp")
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.signcolumn = "number"
vim.o.statuscolumn = "%s %l %r  "

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("n", "<leader>mm", vim.cmd.MCstart, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tp", require'telescope'.extensions.projects.projects, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ww", require'workspaces'.open, {noremap = true, silent = true})
vim.keymap.set("n", "<C-z>", vim.cmd.undo, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tk", vim.cmd.NvimTreeToggle, {noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>wll", require'workspaces'.list, {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wll', ':WorkspacesList<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', ':lua require("harpoon.ui").nav_next()<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>sx', ':w!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qq', ':q!<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })



vim.o.expandtab = true 
vim.o.smartindent = true 
vim.o.tabstop = 4
vim.o.shiftwidth = 4


vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>ps", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, {})

end)


