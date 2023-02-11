if vim.env.DARK_THEME == "1" then
	vim.g.catppuccin_flavour = "mocha"
	vim.o.background = "dark"
else
	vim.g.catppuccin_flavour = "latte"
	vim.o.background = "light"
end

require("catppuccin").setup({
	transparent_background = true,
	background = {
		light = "latte",
		dark = "mocha",
	},
	term_colors = true,
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	show_end_of_buffer = false,
	styles = {
		comments = { "italic" },
		conditionals = { "bold" },
		loops = {},
		functions = { "bold" },
		keywords = {},
		strings = { "italic" },
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {"bold"},
		operators = {"bold"},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		harpoon = true,
		lsp_saga = true,
		lsp_trouble = true,
		mason = true,
		nvimtree = true,
		telescope = true,
		treesitter_context = true,
		treesitter = true,
		which_key = true,
		-- Special
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
	color_overrides = {},
	custom_highlights = {},
})

vim.cmd("colorscheme catppuccin")
