map = vim.keymap.set

default_opts = {
  noremap = true,
  silent = true,
  expr = false,
  nowait = false,
  script = false,
  unique = false,
}

map("n", "[g", [[<Cmd>Gitsigns prev_hunk<CR>]], default_opts)
map("n", "]g", [[<Cmd>Gitsigns next_hunk<CR>]], default_opts)
map("n", "<leader>rh", [[<Cmd>Gitsigns reset_hunk<CR>]], default_opts)
