local cmd = vim.cmd

require("true-zen").setup({
	modes = { -- configurations per mode
		ataraxis = {
			shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
			backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
			minimum_writing_area = { -- minimum size of main window
				width = 70,
				height = 44,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
			padding = { -- padding windows
				left = 52,
				right = 52,
				top = 0,
				bottom = 0,
			},
			callbacks = { -- run functions when opening/closing Ataraxis mode
				open_pre = function()
					cmd([[
					colorscheme gruvbox
					Limelight
				]])
				end,
				close_pos = function()
					cmd([[
					colorscheme tokyonight
					Limelight!
				]])
				end,
			},
		},
	},
	integrations = {
		tmux = false,
		kitty = {
			enabled = true,
			font = "+2",
		},
		lualine = true, -- hide nvim-lualine (ataraxis)
	},
})
