local telescope = require("telescope")

telescope.setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
		},
	},
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		generic_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { "png", "jpeg", "svg", "jpg" },
	},
	pickers = {
		find_files = {},
	},
	on_highlights = function(hl, c)
		local prompt = "#2d3149"
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePreviewTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
	end,
})
