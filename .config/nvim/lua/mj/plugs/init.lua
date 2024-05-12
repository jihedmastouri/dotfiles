return {
	-- Essential Oils --
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",

	-- GIT --
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		config = function()
			vim.keymap.set("n", "[g", [[<Cmd>Gitsigns prev_hunk<CR>]])
			vim.keymap.set("n", "]g", [[<Cmd>Gitsigns next_hunk<CR>]])
			vim.keymap.set("n", "<leader>rh", [[<Cmd>Gitsigns reset_hunk<CR>]])
		end,
	},

	-- la vie en rose --
	"laytan/cloak.nvim",
	{ "numToStr/Comment.nvim", opts = {} },
	{ "folke/which-key.nvim", opts = {} },
	{ "mbbill/undotree", opts = {}, config = function() end }, -- undo/redo history
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			"*",
			"!rust",
			"!go",
			-- '!typescript',
			"!javascript",
			"!python",
		},
	},
	{
		"Wansmer/treesj", -- Colapse/split lines
		config = function()
			local tsj = require("treesj")

			local langs = { --[[ configuration for languages ]]
			}

			tsj.setup({
				use_default_keymaps = false,
				check_syntax_error = true,
				max_join_length = 120,
				cursor_behavior = "hold",
				notify = true,
				langs = langs,
				dot_repeat = true,
			})
			vim.keymap.set("n", "<leader>j", require("treesj").toggle)
		end,
	},
	{
		"ThePrimeagen/harpoon", -- Move Fast Through Most Used Files
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<C-n>", mark.add_file)
			vim.keymap.set("n", "<C-l>", ui.toggle_quick_menu)

			for i = 1, 9, 1 do
				vim.keymap.set("n", string.format("<Space>%s", i), function()
					ui.nav_file(i)
				end)
			end
			vim.keymap.set("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)")
		end,
	},

	-- MISC --
	"theprimeagen/refactoring.nvim",
	"github/copilot.vim",

	-- LSP extra --
	"ray-x/go.nvim",
	"mattn/emmet-vim",
	"tpope/vim-surround",
	"tpope/vim-sleuth",
}
