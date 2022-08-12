require("which-key").setup {}
require('leap').set_default_keymaps()
require("nvim-autopairs").setup {}
require('gitsigns').setup()
require("indent_blankline").setup {
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
}
