-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
    use({ "nvim-treesitter/playground" })
    use({ "nvim-lua/plenary.nvim" })
    use({ "ThePrimeagen/harpoon" })
    use({ "mbbill/undotree" })
    use({ "tpope/vim-fugitive" })
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            { "neovim/nvim-lspconfig" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        },
    })
--       use({
--        "stevearc/conform.nvim",
--        config = function()
--            require("conform").setup()
--        end,
--    })

    use({
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional
        },
    })

    use({
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    })

    use({
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    })

    use({
        "smoka7/multicursors.nvim",
        requires = { "nvimtools/hydra.nvim" },
    })

    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")
    use("m4xshen/autoclose.nvim")
    use("natecraddock/workspaces.nvim")
    use("rebelot/kanagawa.nvim")



    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "mlaursen/vim-react-snippets",
        },
        config = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            require("vim-react-snippets").lazy_load()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local compare = cmp.config.compare
            -- Further configuration if needed
        end,
    }


    use('MunifTanjim/prettier.nvim')

    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
use {"akinsho/toggleterm.nvim", tag = '*'}
use({
  "tadmccorkle/markdown.nvim",
})

use({
  "yorickpeterse/nvim-window",
  config = true,
})


use({
  "VincentBerthier/auto-header.nvim",
  config = true,
})



-- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})



use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

use{"michaelrommel/nvim-silicon",
	opts = {
		disable_defaults = true
	}
}



use({
  "aurum77/live-server.nvim",
    run = function()
      require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  })






end)
