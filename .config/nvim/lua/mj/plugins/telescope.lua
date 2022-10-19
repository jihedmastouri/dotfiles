local telescope = require("telescope")

telescope.setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
		},
	},
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		generic_sorter = require("telescope.sorters").get_fzy_sorter,
	},
	pickers = {
		find_files = {},
	},
})
_G.open_telescope = function()
	local last_arg = vim.v.argv[#vim.v.argv]
	if last_arg and vim.fn.isdirectory(last_arg) == 1 then
		require("telescope.builtin").find_files()
	end
end

vim.cmd([[
	augroup TelescopeOnEnter
		autocmd!
		autocmd VimEnter * lua open_telescope()
	augroup END
]])
