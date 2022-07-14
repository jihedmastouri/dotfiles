local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'gruvbox-community/gruvbox' -- Theme
  use 'tpope/vim-surround' -- VIM Surround
  -- use { "tpop/fugitive"} -- GIT WRAPPER
  -- use {"junegunn/fzf"}  -- Fuzzy Finder
  
  -- Fuzzy Finder
  use { 'nvim-telescope/telescope.nvim',
    requires = { 
	    {'nvim-lua/plenary.nvim'} 
      }
  }

  -- LSP & Completion Plugins
  use 'neovim/nvim-lspconfig'
  use 'neoclide/coc.nvim'
  use 'neoclide/coc-definition'
  use { 'rodrigore/coc-tailwind-intellisense', 
	cmdline = {
		{ 'npm install' }
	}
  }

  -- LUA SNIPPETS
  use 'rafamadriz/friendly-snippets'

  -- Work Tree View
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdtree'

  -- Better Navigation
  use 'easymotion/vim-easymotion'

  -- My Mom Told me this is cool
  use 'vim-airline/vim-airline'
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  -- Working with GIT
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use ' rbong/vim-flog'

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
