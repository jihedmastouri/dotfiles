require("tokyonight.colors").setup({})

vim.g.tokyonight_transparent = true
vim.g.tokyonight_colors = {hint="orange", error="#ff0000", bg_float="None"}
vim.g.tokyonight_transparent_sidebar = true

vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true

vim.cmd [[ hi cursorLine guibg=#848e ]]

if vim.env.DARK_THEME == "1"
then
	vim.g.tokyonight_style = "night" -- night, storm or day
	vim.o.background= 'dark'
else
	vim.g.tokyonight_style = "day"
	vim.o.background= 'light'
end

vim.cmd [[
	colorscheme tokyonight 
]]
