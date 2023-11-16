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
	filters = {
    exclude = { "build", "node_modules", "bin", "obj", "dist", "%.vscode", "%.idea", "assets", "%.git", "%.vercel"},
	},
  actions = {
    expand_all = {
      max_folder_discovery = 30,
    },
    open_file = {
      quit_on_open = true,
    },
    remove_file = {
      close_window = true,
    },
  },
})

map("n", "<leader>e", "<Cmd>NvimTreeFindFileToggle<CR>", default_opts)
map("n", "<leader>\\", "<Cmd>NvimTreeToggle<CR>", default_opts)
