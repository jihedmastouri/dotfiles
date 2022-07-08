--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
map('n', '<Space>.', '<cmd>lua require("telescope.builtin").find_files({cwd = "%:h"})<CR>', opts)
map('n', '<Space>fg', '<cmd>lua require("telescope.builtin").live_grep({cwd = "%:h"})<CR>', opts)
map('n', '<Space>fb', '<cmd>lua require("telescope.builtin").buffers({cwd = "%:h"})<CR>', opts)
map('n', '<Space>fh', '<cmd>lua require("telescope.builtin").help_tags({cwd = "%:h"})<CR>', opts)
