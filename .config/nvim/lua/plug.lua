local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Theme
  use 'folke/tokyonight.nvim'

  -- La vie en Rose
  use 'tpope/vim-surround' -- VIM Surround
  use 'tpope/vim-commentary' -- Comments !!
  use 'puremourning/vimspector' -- Debuging
  use 'ggandor/leap.nvim'
  use 'mbbill/undotree'
  use { 'nvim-telescope/telescope.nvim', -- Fuzz Finder
    requires = { {'nvim-lua/plenary.nvim'} } }
  use 'windwp/nvim-autopairs'

  -- LSP & Completion Plugins
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'neoclide/coc.nvim'
  use 'rafamadriz/friendly-snippets' -- LUA SNIPPETS
  use { 'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Icons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  -- Work Tree View
  use 'kyazdani42/nvim-tree.lua'

  -- My Mom Told me this is cool
  use 'folke/which-key.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', tag = "v2.*"}
  use 'lukas-reineke/indent-blankline.nvim'

  -- Database
  use 'tpope/vim-dadbod'

  -- Working with GIT
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'
  -- LAZYGIT x TMUX <3 <3 <3  --
end)
