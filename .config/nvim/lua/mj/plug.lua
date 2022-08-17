local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Theme --
  use 'morhetz/gruvbox'
  use {
	'folke/tokyonight.nvim',
		config = function()
			require('mj.plugins.theme')
		end
	  }
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use {
	  'Pocco81/true-zen.nvim',
	  opts = true,
	  config = function()
		  require('mj.plugins.zen')
	  end
	}
  use {
		'junegunn/limelight.vim',
		config = function()
			vim.g.limelight_conceal_guifg = 'DarkGray'
		end
	}

  -- Work Tree & Navigation --
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} },
	  config = function()
		  require('mj.plugins.telescope')
	  end
  }
  use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			require('mj.plugins.nvim-tree')
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
			require('mj.plugins.autopairs')
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
  use { 'tpope/vim-abolish', opts = true } -- abbr and subst

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
  use {
	  'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns").setup {
				current_line_blame = true,
				current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> -> <summary>'
			}
		end
	}
  -- LAZYGIT x TMUX <3 <3 <3  --

  -- VimWiki
  use {
	  'vimwiki/vimwiki',
		config = function()
			vim.g.vimwiki_list = { { path = '~/Documents/vimwiki'} }
		end
	  }
end)
