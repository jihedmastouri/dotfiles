return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"gp",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = false,
		-- format_on_save = function(bufnr)
		-- 	local disable_filetypes = { c = true, cpp = true }
		-- 	return {
		-- 		timeout_ms = 500,
		-- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		-- 	}
		-- end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt", "goimports" },
			javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
			svelte = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
			json = { "biome", "prettierd", "prettier", stop_after_first = true },
			html = { "biome", "prettierd", "prettier", stop_after_first = true },
			markdown = { "biome", "prettierd", "prettier", stop_after_first = true },
			python = { "isort", "ruff_format" },
			rust = { "rustfmt", lsp_fallback = "fallback" },
		},
	},
}
