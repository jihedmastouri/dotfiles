local tsj = require('treesj')

local langs = {--[[ configuration for languages ]]}

tsj.setup({
  use_default_keymaps = false,
  check_syntax_error = true,
  max_join_length = 120,
  cursor_behavior = 'hold',
  notify = true,
  langs = langs,
  dot_repeat = true,
})

vim.keymap.set('n', '<leader>j', require('treesj').toggle)
