local default_opts = {
  noremap = true,
  silent = true,
  expr = false,
  nowait = false,
  script = false,
  unique = false,
}

-- mode (string)
-- keys (string)
-- cmd (string)
keymap = function (mode, keys, cmd)
	vim.keymap.set(mode,keys,cmd, default_opts)
end

keymap("n", "[g", [[<Cmd>Gitsigns prev_hunk<CR>]])
keymap("n", "]g", [[<Cmd>Gitsigns next_hunk<CR>]])
keymap("n", "<leader>rh", [[<Cmd>Gitsigns reset_hunk<CR>]])
