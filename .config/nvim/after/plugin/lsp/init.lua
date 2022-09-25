-- LSP CONFIG SETUP --
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

require("lspconfig").tsserver.setup(config({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end,
}))

require("lspconfig").cssls.setup(config())
require("lspconfig").pyright.setup(config())

require("lspconfig").emmet_ls.setup(config({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
}))

require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

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
