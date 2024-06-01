return {
	{ "windwp/nvim-ts-autotag", before = "treesitter.nvim" },
	{
		"nvim-treesitter/nvim-treesitter-context",
		before = "nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				line_numbers = true,
				enable = true,
				throttle = true,
				max_lines = 3,
				separator = "_",
				show_all_context = false,
			})
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context()
			end, { silent = true })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				sync_install = false,
				auto_install = true,
				modules = {},
				ignore_install = {},
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
				ensure_installed = {
					"astro",
					"bash",
					"css",
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
					"svelte",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"yaml",
					"zig",
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
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
						set_jumps = false,
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
		end,
	},
}
