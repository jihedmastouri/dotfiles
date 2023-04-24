local telescope = require("telescope")

telescope.setup({
	extensions = {
		-- file_browser = {
		-- 	theme = "ivy",
		-- 	hijack_netrw = true,
		-- },
	},
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		generic_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { "png", "jpeg", "svg", "jpg" },
	},
	-- pickers = {
	-- 	find_files = {},
	-- },
})
