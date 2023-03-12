require("fidget").setup({
	text = {
		spinner = "dots",
		done = "✔",
		commenced = " ",
		completed = " ",
	},
	window = {
		relative = "editor",
		blend = 0,
		border = "rounded",
	},
	fmt = {
		stack_upwards = false, -- list of tasks grows upwards
		max_width = 20,
	},
	sources = {
		null_ls = { -- Name of source
			ignore = true, -- Ignore notifications from this source
		},
	},
})
