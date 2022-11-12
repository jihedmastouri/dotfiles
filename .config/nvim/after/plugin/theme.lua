if vim.env.DARK_THEME == "1" then
	vim.g.catppuccin_flavour = "mocha"
	vim.o.background = "dark"
else
	vim.g.catppuccin_flavour = "latte"
	vim.o.background = "light"
end

require("catppuccin").setup({
	transparent_background = true,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = { "bold" },
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		leap = true,
		lsp_trouble = true,
		lsp_saga = true,
		which_key = true,
		dashboard = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	color_overrides = {},
	custom_highlights = {},
})

vim.cmd("colorscheme catppuccin")
