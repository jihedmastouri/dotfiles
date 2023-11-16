require("treesitter-context").setup({
  line_numbers = true,
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	throttle = true, -- Throttles plugin updates (may improve performance)
	max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
	show_all_context = false,
})

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })
