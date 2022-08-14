local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Theme --
  use {
	'folke/tokyonight.nvim',
		config = function()
			require('mj.plugins.theme')
		end
	  } 
  use 'ryanoasis/vim-devicons' 
  use 'kyazdani42/nvim-web-devicons' 
  use { 'Pocco81/true-zen.nvim', opts = true }


  -- Work Tree & Navigation --
  use 'kyazdani42/nvim-tree.lua'
  use { 
	'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }, 
		config = function() 
			require('mj.plugins.telescope') 
		end 
	  }


  -- La vie en Rose --
  use 'tpope/vim-surround' -- VIM Surround 
  use 'tpope/vim-commentary' --Comments !! 
  use { 
	  'ggandor/leap.nvim', 
		config = function()
			require("leap").set_default_keymaps() 
		end 
	} 
  use {
	 'windwp/nvim-autopairs', 
		config =  function()
			require("nvim-autopairs").setup {} 
		end
	}
  use { 'nicwest/vim-camelsnek', opts = true } -- change cases 
  use { 'puremourning/vimspector', opts = true } -- Debuging


  -- LSP & Completion Plugins --
  use { 
	  'neoclide/coc.nvim', 
	  branch = 'release'
	}
  use {
	  'nvim-treesitter/nvim-treesitter', 
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true }) 
		end,
		config = function() 
			require'nvim-treesitter.configs'.setup {
			ensure_installed = "all", } 
		end 
	} 
  use 'nvim-treesitter/nvim-treesitter-context'
  use { 'rhysd/vim-grammarous', opts = true } -- Grammarly use
  use 'tpope/vim-abolish' -- abbr and subst

  -- My Mom Told me this is cool --
  use { 'mbbill/undotree', opts = true } -- undo/redo history 
  use {
		'folke/which-key.nvim', 
		config = function() 
			require("which-key").setup {}
		end 
	} 
  use { 'nvim-lualine/lualine.nvim', 
		config = function()
			require('mj.plugins.lualine') 
		end 
	} 
  use { 
		'akinsho/bufferline.nvim', 
		tag = "v2.*", 
		config = function() 
			require('mj.plugins.bufferline') 
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

  -- Working with GIT --
  use { 'sindrets/diffview.nvim', opts = true } 
  use 'lewis6991/gitsigns.nvim'

  -- LAZYGIT x TMUX <3 <3 <3  --
end)
