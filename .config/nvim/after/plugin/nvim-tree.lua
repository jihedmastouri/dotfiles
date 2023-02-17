require("nvim-tree").setup({
	auto_reload_on_write = true,
	sort_by = "case_insensitive",
	view = {
		adaptive_size = true,
		side = "right",
		signcolumn = "yes",
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		highlight_git = true,
		highlight_opened_files = "name",
	},
	actions = {
		expand_all = {
			max_folder_discovery = 30,
			exclude = { "build", "node_modules", "bin", ".*", "obj", "dist", ".vscode", ".idea", "assets" },
		},
		open_file = {
			quit_on_open = true,
		},
		remove_file = {
			close_window = true,
		},
	},
})
