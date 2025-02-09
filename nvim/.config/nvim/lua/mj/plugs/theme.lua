vim.cmd([[
  let g:sonokai_enable_italic=1
  let g:sonokai_diagnostic_virtual_text='colored'
  let g:sonokai_diagnostic_text_highlight=1
  let g:sonokai_transparent_background=0
]])

return {
	"sainnhe/sonokai", -- Dark Theme
	{ "catppuccin/nvim", as = "catppuccin" }, -- Light Theme
	{
		"nvim-tree/nvim-web-devicons",
		enabled = vim.g.have_nerd_font,
		opts = {
			default = true,
		},
	},

	-- Other visual stuff
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			"*",
			"!rust",
			"!go",
			-- '!typescript',
			"!javascript",
			"!python",
		},
	},
}
