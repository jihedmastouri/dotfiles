local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  -- Theme
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'

  -- La vie en Rose
  use 'tpope/vim-surround' -- VIM Surround
  use 'tpope/vim-commentary' -- Comments !!
  use 'puremourning/vimspector' -- Debuging
  use 'rafamadriz/friendly-snippets' -- LUA SNIPPETS
  use 'ggandor/leap.nvim'
  -- Fuzzy Finder
  use { 'nvim-telescope/telescope.nvim',
    requires = {
	    {'nvim-lua/plenary.nvim'}
      }
  }

  -- LSP & Completion Plugins
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'neoclide/coc.nvim'

  -- Icons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  -- Work Tree View
  -- use 'preservim/nerdtree'
  use 'kyazdani42/nvim-tree.lua'

  -- My Mom Told me this is cool
  --use 'vim-airline/vim-airline'
  --'use 'vim-airline/vim-airline-themes'
  use 'folke/which-key.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', tag = "v2.*"}
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Database
  use 'tpope/vim-dadbod'

  -- Working with GIT
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'sindrets/diffview.nvim'
  use 'junegunn/gv.vim'

end)

-- OLD PLUGINS
-- COMPLETION:
-- use 'hrsh7th/cmp-buffer'
-- use 'hrsh7th/cmp-path'
-- use 'hrsh7th/cmp-cmdline'
-- use 'hrsh7th/nvim-cmp'
-- use 'hrsh7th/cmp-nvim-lsp'

-- SNIPPETS:
-- use 'saadparwaiz1/cmp_luasnip'
-- use 'L3MON4D3/LuaSnip'
