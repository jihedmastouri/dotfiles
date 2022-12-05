-- LSP CONFIG SETUP --
local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

nvim_lsp.html.setup({
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	capabilities = capabilities,
})

nvim_lsp.pyright.setup({})

nvim_lsp.gopls.setup({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

-- Design --
require("lspsaga").init_lsp_saga({
	code_action_icon = "💡",
	code_action_lightbulb = {
		enable = true,
		enable_in_insert = false,
		virtual_text = false,
	},
})

require("trouble").setup({})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Snippets --
require("luasnip").config.setup({
	region_check_events = "CursorMoved",
	enable_autosnippets = true,
})
require("luasnip.loaders.from_vscode").lazy_load()
