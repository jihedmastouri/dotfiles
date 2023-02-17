require("hlargs").setup()
require("nvim-treesitter.configs").setup({})
require("indent_blankline").setup({
	char = "┊",
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
})
require("which-key").setup({})
-- Git Stuf
require("gitsigns").setup()
require("diffview").setup()
require("headlines").setup()
require("colorizer").setup({
	css = { rgb_fn = true },
	"javascript",
	html = { mode = "background" },
}, { mode = "foreground" })
