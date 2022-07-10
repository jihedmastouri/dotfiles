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
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'

  -- Work Tree View
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdtree'
end)

