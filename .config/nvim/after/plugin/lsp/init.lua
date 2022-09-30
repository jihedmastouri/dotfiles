-- LSP CONFIG SETUP --
local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.sumneko_lua.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end,
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

nvim_lsp.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

nvim_lsp.tsserver.setup({
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end,
})

nvim_lsp.tailwindcss.setup({})

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
require("lspsaga").init_lsp_saga({})

require("trouble").setup({})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Snippets --
require("luasnip.loaders.from_vscode").lazy_load()
