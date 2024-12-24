-- vey to yank word
-- viwp to replace word 
-- vep to replace till last char of word
-- "+yy to copy to system clipboard
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.signcolumn = "number"
vim.o.statuscolumn = "%s %l %r  "
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.complete = ""


vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("n", "<leader>mm", vim.cmd.MCstart, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus, { noremap = true, silent = true })
--vim.keymap.set("n", "<leader>tp", require 'telescope'.extensions.projects.projects, { noremap = true, silent = true })
--vim.keymap.set("n", "<leader>ww", require 'workspaces'.open, { noremap = true, silent = true })
vim.keymap.set("n", "<C-z>", vim.cmd.undo, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tk", vim.cmd.NvimTreeToggle, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", ':Format', { noremap = true, silent = true })
vim.keymap.set("n", "<C-v>v", ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<C-v>+", ':vertical resize +10<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<C-v>-", ':vertical resize -10<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<C-v>b", ':split<CR>', { noremap = true, silent = true })
--vim.keymap.set("n", "<leader>wll", require'workspaces'.list, {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wll', ':WorkspacesList<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', ',',"w :lua require('nvim-window').pick()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>sx', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })


--vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files, {})
--vim.keymap.set("n", "<leader>fp", require("telescope.builtin").live_grep, {})
--vim.keymap.set("n", "<leader>pd", function()
--   require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
--vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, {})
--end)


vim.keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })



vim.keymap.set("t", "<Esc>", vim.cmd.stopinsert, {noremap = true, silent = true})

-- Render Markdown

-- Toggle Term

vim.keymap.set("n", "<leader>tf", ':ToggleTerm direction=float<CR>', {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tv", ':ToggleTerm direction=vertical<CR>', {noremap = true, silent = true})
vim.keymap.set("n", "<leader>v", vim.cmd.noh, {noremap = true, silent = true})


