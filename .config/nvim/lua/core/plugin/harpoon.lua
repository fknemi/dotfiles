local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
require("telescope").load_extension('harpoon')

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>vk", function()
    ui.nav_file(1)
end)

vim.keymap.set("n", "<leader>bk", function()
    ui.nav_file(2)
end)

vim.keymap.set("n", "<leader>nk", function()
	ui.nav_file(3)
end)

vim.keymap.set("n", "<leader>mk", function()
    ui.nav_file(4)
end)


