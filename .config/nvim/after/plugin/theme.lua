require("tokyonight.colors").setup({})

vim.g.tokyonight_style = "night" -- night, storm or day
vim.g.tokyonight_transparent = true
vim.g.tokyonight_colors = {hint="orange", error="#ff0000", bg_float="none"}

vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true

vim.cmd [[
	colorscheme tokyonight
	autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
]]

