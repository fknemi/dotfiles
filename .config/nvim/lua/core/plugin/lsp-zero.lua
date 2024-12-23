require("lsp-zero")
local cmp = require("cmp_nvim_lsp")
local luasnip = require("luasnip")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp.default_capabilities(capabilities)
require("lspconfig.configs")
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- Theme, colors and gui
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end




require("lspconfig").intelephense.setup({
	on_attach = on_attach,
	--flags  = lsp_flags,
})
require("lspconfig").pyright.setup({
	on_attach = on_attach,
	--flags = lsp_flags,
	
})
require("lspconfig").ast_grep.setup({
	on_attach = on_attach,
	--flags = lsp_flags,
})
require("lspconfig").svelte.setup({
	on_attach = on_attach,
	--flags = lsp_flags,
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
	--flags = lsp_flags,
})

require("lspconfig").harper_ls.setup({
	on_attach = on_attach,
	--flags = lsp_flags,
})

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	--flags = lsp_flags,
})


require("lspconfig").tsserver.setup({
	on_attach = on_attach,

})

require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,

})

require("lspconfig").cssls.setup({
	on_attach = on_attach,

})

require("lspconfig").volar.setup({
	on_attach = on_attach,

})


require("lspconfig").angularls.setup({
	on_attach = on_attach,

})

require("lspconfig").jdtls.setup({
	on_attach = on_attach,

})



local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
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
    -- jsx_bracket_same_line = false,
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

