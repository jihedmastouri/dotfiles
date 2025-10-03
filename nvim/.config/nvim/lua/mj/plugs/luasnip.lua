return {
	"rafamadriz/friendly-snippets",
	{
		"L3MON4D3/LuaSnip",
		build = (function()
			if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
				return
			end
			return "make install_jsregexp"
		end)(),
		config = function()
			local ls = require("luasnip")
			ls.setup({
				history = true,
				region_check_events = "CursorHold,InsertLeave",
				delete_check_events = "TextChanged,InsertEnter",
				enable_autosnippets = true,
				store_selection_keys = "<c-s>",
			})
			ls.filetype_extend("typescript", { "javascriptreact", "typescriptreact" })
		end,
	},
}
