local use = require("packer").use

require("packer").startup(function()
	-- Essential Oils --
	use("wbthomason/packer.nvim") -- Package manager
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Theme --
	use("catppuccin/nvim")
	use({
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	})
	use({
		"Pocco81/true-zen.nvim",
		opt = true,
		cmd = { "TZAtaraxis" },
		config = function()
			require("mj.plugins.zen")
		end,
		requires = {
			"junegunn/limelight.vim",
			opts = true,
			config = function()
				vim.g.limelight_conceal_guifg = "DarkGray"
			end,
		},
	})

	-----------------------
	-- GUI --
	-----------------------
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("mj.plugins.telescope")
		end,
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-tree.lua")

	-----------------------
	-- La vie en Rose --
	-----------------------
	use("tpope/vim-surround") -- VIM Surround
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	})
	use({ "windwp/nvim-autopairs", before = "nvim-cmp" })
	use({ "windwp/nvim-ts-autotag", before = "treesitter.nvim" })
	use("norcalli/nvim-colorizer.lua")
	use("mattn/emmet-vim")

	-----------------------
	--  Text Highlighting --
	-----------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				sync_install = false,
				autotag = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter-context", before = "nvim-treesitter" })
	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})
	use("m-demare/hlargs.nvim")

	----------------------------------
	-- My Mom Told me this is cool --
	----------------------------------
	use({ "mbbill/undotree", opts = true }) -- undo/redo history
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_trailing_blankline_indent = false,
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-----------------------
	-- Working with GIT --
	-----------------------
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-----------------------
	-- LSP --
	-----------------------
	-- Install LSPs
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- Native LSP config
	use("neovim/nvim-lspconfig")
	-- Completions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-emoji")
	use("octaltree/cmp-look")
	use("hrsh7th/cmp-calc")
	-- Add Formatter/Linter/Action Support
	use("jose-elias-alvarez/null-ls.nvim")
	-- Luxury
	use("onsails/lspkind.nvim")
	use("glepnir/lspsaga.nvim")
	use("folke/trouble.nvim")

	-----------------------
	-- Snippets --
	-----------------------
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-----------------------
	-- DEBUGGER --
	-----------------------
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
end)
