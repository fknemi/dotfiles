local builtin = require("telescope.builtin")
require("telescope").load_extension("file_browser")
vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fp", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>pd", function()
   require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
   vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, {})
end)



return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
