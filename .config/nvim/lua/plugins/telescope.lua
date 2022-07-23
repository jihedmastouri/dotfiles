local telescope = require('telescope')

telescope.setup {
  defaults = {
	file_sorter =  require'telescope.sorters'.get_fzy_sorter,
	generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
  pickers = {
    find_files = {
	}
  }
}

_G.open_telescope = function()
    local first_arg = vim.v.argv[2]
    if first_arg and vim.fn.isdirectory(first_arg) == 1 then
        vim.g.loaded_netrw = true

        require("telescope.builtin").find_files({search_dirs = {first_arg}})
    end
end


vim.api.nvim_exec([[
	augroup TelescopeOnEnter
		autocmd!
		autocmd VimEnter * lua open_telescope()
	augroup END
]], false)
