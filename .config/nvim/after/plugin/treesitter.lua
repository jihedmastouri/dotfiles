require("nvim-treesitter.configs").setup({
  sync_install = false,
  auto_install = true,
	build = ":TSUpdate",
  ensure_installed = {
		"astro",
		"bash",
		"css",
		"diff",
		"dockerfile",
		"git_config",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"html",
		"htmldjango",
		"ini",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"prisma",
		"proto",
		"python",
		"regex",
		"rust",
		"scss",
		"sql",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@class.outer",
        ["]]"] = "@function.outer",
      },
      goto_next_end = {
        ["]M"] = "@class.outer",
        ["]["] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@class.outer",
        ["[["] = "@function.outer",
      },
      goto_previous_end = {
        ["[M"] = "@class.outer",
        ["[]"] = "@function.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
})
