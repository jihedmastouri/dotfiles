local exluded = {
    "build", "node_modules", "bin", "obj", "dist", "%.vscode",
		"%.idea", "assets", "%.git", "%.vercel"
}

require("nvim-tree").setup({
  auto_reload_on_write = true,
  view = {
    adaptive_size = true,
		side = "right",
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

keymap("n", "<leader>e", "<Cmd>NvimTreeFindFileToggle<CR>")
keymap("n", "<leader>\\", "<Cmd>NvimTreeToggle<CR>")
