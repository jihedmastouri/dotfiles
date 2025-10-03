-- Enable soft wrapping
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.showbreak = "↪ "

-- Better navigation for wrapped lines
vim.keymap.set('n', 'j', 'gj', { buffer = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { buffer = true, silent = true })
vim.keymap.set('n', '0', 'g0', { buffer = true, silent = true })
vim.keymap.set('n', '$', 'g$', { buffer = true, silent = true })

-- Format options
vim.opt_local.formatoptions:append("t") -- Auto-wrap text
vim.opt_local.formatoptions:append("c") -- Auto-wrap comments
vim.opt_local.formatoptions:append("q") -- Allow formatting of comments with gq
vim.opt_local.formatoptions:remove("o") -- Don't continue comments with o/O
