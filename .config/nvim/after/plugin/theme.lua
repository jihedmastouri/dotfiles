require("tokyonight").setup({
	transparent = true,
	styles = {
		comments = "italic",
		keywords = "italic",
		functions = "italic",
		variables = "italic",
		floats = "transparent",
		sidebars = "transparent",
	},
	on_colors = function(colors)
		colors.border = colors.blue0
		colors.bg_highlight = "#2f3e5f"
	end,
})

local colors = require("tokyonight.colors")

if vim.env.DARK_THEME == "1" then
	vim.g.gruvbox_contrast_dark = "hard"
	vim.g.gruvbox_invert_selection = "0"
	colors.style = "moon"
	vim.o.background = "dark"
else
	vim.g.gruvbox_contrast_dark = "hard"
	colors.style = "night"
	vim.o.background = "light"
end

vim.cmd("colorscheme tokyonight")
