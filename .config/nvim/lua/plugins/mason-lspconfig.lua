

return {'williamboman/mason-lspconfig.nvim',
config = function()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "ast_grep" },
})


end
}
