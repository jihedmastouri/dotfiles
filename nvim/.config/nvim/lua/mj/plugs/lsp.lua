local function nex()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end
local function prev()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end

return {
	"fatih/vim-go",
	"tpope/vim-surround",
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
					map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("go", vim.lsp.buf.type_definition, "Type [D]efinition")
					map("ga", vim.lsp.buf.code_action, "[G]ode [A]ction")
					map("gw", vim.lsp.buf.workspace_symbol, "[W]orkspace symbol")
					map("gl", vim.diagnostic.open_float, "[L]SP Show Diagnostics")

					map("gs", vim.lsp.buf.signature_help, "[S]ignature Help")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					vim.keymap.set(
						"i",
						"<C-k>",
						vim.lsp.buf.signature_help,
						{ buffer = event.buf, desc = "LSP: Signature Help" }
					)

					map("<F2>", vim.lsp.buf.rename, "Rename Variable")
					map("<F3>", vim.lsp.buf.format, "Format")

					map("]e", nex, "Go to next error")
					map("[e", prev, "Go to previous error")
					map("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
					map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			local nvim_lsp = require("lspconfig")

			local servers = {
				gopls = {},
				pyright = {},
				rust_analyzer = {},
				-- denols = {
				-- 	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
				-- },
				ts_ls = {
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = false
					end,
					root_dir = nvim_lsp.util.root_pattern("package.json"),
					single_file_support = false,
				},
				-- helm_ls = {
				-- 	settings = {
				-- 		["helm-ls"] = {
				-- 			yamlls = {
				-- 				path = "yaml-language-server",
				-- 			},
				-- 		},
				-- 	},
				-- },
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				-- "stylua",
				"tailwindcss",
				-- "svelte-language-server",
				"cssls",
				"html",
				"emmet_language_server",
				-- "astro",
				"yamlls",
				"json-lsp",
				"harper_ls",
				"prettierd",
				-- "hls",
				-- "eslint",
				-- "biome",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						nvim_lsp[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
