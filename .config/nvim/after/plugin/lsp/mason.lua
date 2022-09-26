require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "eslint_d", "jsonls", "pylint", "sql_formatter", "prettier", "stylua", "spell", "misspell" },
	automatic_installation = true,
})
