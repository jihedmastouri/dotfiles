return {
  "tpope/vim-fugitive",
  {
	  "lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "[g", [[<Cmd>Gitsigns prev_hunk<CR>]])
			vim.keymap.set("n", "]g", [[<Cmd>Gitsigns next_hunk<CR>]])
			vim.keymap.set("n", "<leader>rh", [[<Cmd>Gitsigns reset_hunk<CR>]])
		end,
	},
}