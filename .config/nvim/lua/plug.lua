local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'gruvbox-community/gruvbox' -- Theme

  -- La vie en Rose
  use 'tpope/vim-surround' -- VIM Surround
  use 'tpope/vim-commentary' -- Comments !!
  use 'easymotion/vim-easymotion' -- Better Navigation
  use 'puremourning/vimspector' -- Debuging
  use 'rafamadriz/friendly-snippets' -- LUA SNIPPETS

  -- Fuzzy Finder
  use { 'nvim-telescope/telescope.nvim',
    requires = { 
	    {'nvim-lua/plenary.nvim'} 
      }
  }

  -- LSP & Completion Plugins
  use 'neovim/nvim-lspconfig'
  use 'neoclide/coc.nvim'

  -- Work Tree View
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdtree'

  -- My Mom Told me this is cool
  use 'vim-airline/vim-airline'
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

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
