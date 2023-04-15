local use = require("packer").use

require("packer").startup(function()
  -- Essential Oils --
  use("wbthomason/packer.nvim") -- Package manager
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")

  -- Theme --
  use ('jacoborus/tender.vim')
  use ('rose-pine/neovim')

  use({
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  })
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
  use("echasnovski/mini.animate")

  -----------------------
  -- GUI --
  -----------------------
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")
  use("nvim-lualine/lualine.nvim")
  use("j-hui/fidget.nvim")
  use("kyazdani42/nvim-tree.lua")

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
  use({
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup()
    end,
  })
  use({
    "barrett-ruth/import-cost.nvim",
    run = "sh install.sh npm",
  })

  ----------------------------------
  -- My Mom Told me this is cool --
  ----------------------------------
  use({ "mbbill/undotree", opts = true }) -- undo/redo history
  use("ThePrimeagen/harpoon")             -- Move Fast Through Most Used Files
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })
  use("lukas-reineke/indent-blankline.nvim")
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -----------------------
  -- Working with GIT --
  -----------------------
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()
    end,
  })

  -----------------------
  -- LSP --
  -----------------------
   use({
     "VonHeikemen/lsp-zero.nvim",
     branch = "v2.x",
     requires = {
       -- LSP Support
       { "neovim/nvim-lspconfig" },             -- Required
       { "williamboman/mason.nvim" },           -- Optional
       { "williamboman/mason-lspconfig.nvim" }, -- Optional

       -- Autocompletion
       { "hrsh7th/nvim-cmp" },     -- Required
       { "hrsh7th/cmp-nvim-lsp" }, -- Required
       { "hrsh7th/cmp-buffer" },   -- Optional
       { "hrsh7th/cmp-path" },     -- Optional
       { "hrsh7th/cmp-nvim-lua" }, -- Optional

       -- Snippets
       { "L3MON4D3/LuaSnip" },             -- Required
       { "rafamadriz/friendly-snippets" }, -- Optional
       { "saadparwaiz1/cmp_luasnip" },     -- Optional
     },
  })

  -- Completions
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-emoji")
  use("octaltree/cmp-look")
  use("hrsh7th/cmp-calc")
  use("amarakon/nvim-cmp-buffer-lines")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use({
    "danymat/neogen",
    config = function()
      require('neogen').setup({})
    end,
  })

  -- Interactivity
  use("metakirby5/codi.vim")

  -- Add Formatter/Linter/Action Support
  use("jose-elias-alvarez/null-ls.nvim")

  -- Luxury
  use("onsails/lspkind.nvim")
  use("glepnir/lspsaga.nvim")
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  })

  use("rhysd/vim-go-impl")

  -----------------------
  -- DEBUGGER --
  -----------------------
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
end)
