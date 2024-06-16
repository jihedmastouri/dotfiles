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
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			python = { "isort", "black" },
			rust = { "rustfmt" },
		},
	},
}
