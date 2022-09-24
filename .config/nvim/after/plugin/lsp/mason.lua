require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "gopls", "tsserver", "rust_analyzer" }
})
