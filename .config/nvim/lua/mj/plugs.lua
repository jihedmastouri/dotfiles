local use = require("packer").use

require("packer").startup(function()
  -- Essential Oils --
  use("wbthomason/packer.nvim") -- Package manager
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")

  -- Theme --
  use("sainnhe/sonokai")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  })

  -----------------------
  -- GUI --
  -----------------------
  use("kyazdani42/nvim-tree.lua")
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")
  use("nvim-lualine/lualine.nvim")
  use({ "j-hui/fidget.nvim", tag = "legacy" })
	use("simrat39/symbols-outline.nvim")

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
  use({ "windwp/nvim-autopairs", before = "nvim-cmp" })
  use({ "windwp/nvim-ts-autotag", before = "treesitter.nvim" })
  use("norcalli/nvim-colorizer.lua")
  use("mattn/emmet-vim")
  use("Wansmer/treesj") -- Colapse/split lines

  -----------------------
  --  Text Highlighting --
  -----------------------
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use({ "nvim-treesitter/nvim-treesitter-context", before = "nvim-treesitter" })
  use({
    -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  ----------------------------------
  -- My Mom Told me this is cool --
  ----------------------------------
  use({ "mbbill/undotree", opts = true }) -- undo/redo history
  use("ThePrimeagen/harpoon")            -- Move Fast Through Most Used Files
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })
  use("lukas-reineke/indent-blankline.nvim")

  -----------------------
  -- Working with GIT --
  -----------------------
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use("tpope/vim-fugitive")

  -----------------------
  -- LSP --
  -----------------------
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },          -- Required
      { "williamboman/mason.nvim" },        -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },  -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" },  -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" },          -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" },  -- Optional
    },
  })

  -- Completions
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp-signature-help")

	use("b0o/schemastore.nvim")
	use("sbdchd/neoformat")
	use("theprimeagen/refactoring.nvim")

  -- Luxury
  use("onsails/lspkind.nvim")
  use({
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  })

  use({
    "ray-x/go.nvim",
    config = function()
      require("go").setup()
    end,
  })
end)
