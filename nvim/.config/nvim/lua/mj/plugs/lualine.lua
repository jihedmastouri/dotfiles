return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "packer", "NvimTree", "which-key" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "diagnostics", sources = { "nvim_lsp" } } },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "branch", "diff" },
			lualine_y = { "filetype" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = { "filename" },
		},
	},
}
