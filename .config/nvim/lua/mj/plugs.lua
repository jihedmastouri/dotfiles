local use = require("packer").use

require("packer").startup(function()
	-- Essential Oils --
	use("wbthomason/packer.nvim") -- Package manager
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Theme --
	use("folke/tokyonight.nvim")
	use("ryanoasis/vim-devicons")
	use("kyazdani42/nvim-web-devicons")
	use("morhetz/gruvbox")
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

	-- GUI --
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

	-- La vie en Rose --
	use("tpope/vim-surround") -- VIM Surround
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"ggandor/leap.nvim",
		opt = true,
		config = function()
			require("leap").set_default_keymaps()
		end,
	})
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use({
		"simrat39/symbols-outline.nvim",
		opt = true,
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup({
				highlight_hovered_item = true,
				show_guides = true,
			})
		end,
	})

	--  Text Highlighting --
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
			})
		end,
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use("m-demare/hlargs.nvim")

	-- My Mom Told me this is cool --
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
		opts = true,
		run = "cd app && yarn install",
	})

	-- Working with GIT --
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- LSP --
	-- Install LSPs
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- Native LSP config
	-- Completions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-buffer")
	-- Add Formatter/Linter/Action Support
	use("jose-elias-alvarez/null-ls.nvim")
	-- Aesthetics
	use("onsails/lspkind.nvim")
	use("glepnir/lspsaga.nvim")
	use("folke/trouble.nvim")

	use("github/copilot.vim")

	-- Snippets --
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- DEBUGGER --
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
end)
