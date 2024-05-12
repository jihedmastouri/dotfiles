local exluded = {
	"build",
	"node_modules",
	"bin",
	"obj",
	"dist",
	"%.vscode",
	"%.idea",
	"assets",
	"%.git",
	"%.vercel",
}

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			auto_reload_on_write = true,
			view = {
				adaptive_size = true,
				side = "left",
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				highlight_git = true,
				highlight_opened_files = "name",
			},
			diagnostics = {
				enable = true,
				icons = diag_icons,
			},
			actions = {
				expand_all = {
					max_folder_discovery = 30,
					exclude = exluded,
				},
				open_file = {
					quit_on_open = true,
				},
				remove_file = {
					close_window = true,
				},
			},
		})
		vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeFindFileToggle<CR>")
		vim.keymap.set("n", "<leader>\\", "<Cmd>NvimTreeToggle<CR>")
	end,
}
