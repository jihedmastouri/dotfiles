local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Theme --
  use 'folke/tokyonight.nvim'
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'morhetz/gruvbox'
  use 'folke/zen-mode.nvim'
  use 'folke/twilight.nvim'

  -- Essential Oils --
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- GUI --
  use {
	  'nvim-telescope/telescope.nvim',
	  config = function()
		  require('mj.plugins.telescope')
	  end
  }
  use { 'akinsho/bufferline.nvim', tag = "v2.*" }
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-tree.lua'

  -- La vie en Rose --
  use 'tpope/vim-surround' -- VIM Surround
  use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
  use {
	  'ggandor/leap.nvim',
		config = function()
			require("leap").set_default_keymaps()
		end
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'ap/vim-css-color'
  use 'simrat39/symbols-outline.nvim'

  -- Completion Plugins --
  use {
	'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup { 
				ensure_installed = "all",
				sync_install = false
		}
		end
	}
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
	  'iamcco/markdown-preview.nvim',
	  opts=true, run = 'cd app && yarn install'
  }
  use {
	 'folke/trouble.nvim',
	 config = function ()
		 require("trouble").setup {}
	 end
  }
  use 'm-demare/hlargs.nvim'

  -- My Mom Told me this is cool --
  use { 'mbbill/undotree', opts = true } -- undo/redo history
  use {
		'folke/which-key.nvim',
		config = function()
			require("which-key").setup {}
		end
	}
  use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
		require("indent_blankline").setup {
			show_trailing_blankline_indent =false,
			show_current_context = true,
			show_current_context_start = true,
		}
  end }
  use 'j-hui/fidget.nvim'
  use 'kosayoda/nvim-lightbulb'

  -- Working with GIT --
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'
  use 'kdheepak/lazygit.nvim'

 -- LSP --
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'weilbith/nvim-code-action-menu'
  use 'onsails/lspkind.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

-- DEBUGGER --
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'

end)
