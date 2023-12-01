require("treesitter-context").setup({
  line_numbers = true,
	enable = true,
	throttle = true,
	max_lines = 3,
	show_all_context = false,
})

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })
