require("colorizer").setup()
require("hlargs").setup()
require("nvim-treesitter.configs").setup({})
require("indent_blankline").setup({
	char = "┊",
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
})
require("which-key").setup({})
