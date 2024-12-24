return {
	"neovim/nvim-lspconfig",
	cmd = "LspInfo",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Attach function for LSP
		local lsp_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

			-- Set up key mappings for LSP actions
			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<leader>fx", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
			vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		end

		-- Capabilities for nvim-cmp integration
		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- Set up LSP servers
		lspconfig.intelephense.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.pyright.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.ast_grep.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.svelte.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.harper_ls.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.tsserver.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.rust_analyzer.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.cssls.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.volar.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})
		lspconfig.angularls.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
		})

		-- Prettier setup for formatting
		local prettier = require("prettier")
		prettier.setup({
			bin = "prettier", -- or 'prettierd' (v0.23.3+)
			filetypes = {
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"markdown",
				"scss",
				"typescript",
				"typescriptreact",
				"yaml",
			},
			cli_options = {
				arrow_parens = "always",
				bracket_spacing = true,
				bracket_same_line = false,
				embedded_language_formatting = "auto",
				end_of_line = "lf",
				html_whitespace_sensitivity = "css",
				jsx_single_quote = false,
				print_width = 80,
				prose_wrap = "preserve",
				quote_props = "as-needed",
				semi = true,
				single_attribute_per_line = false,
				single_quote = false,
				tab_width = 4,
				trailing_comma = "es5",
				use_tabs = false,
				vue_indent_script_and_style = false,
			},
		})
	end,
}
