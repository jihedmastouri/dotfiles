vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.splitright = true

vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.mouse = ''
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 4
-- vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false

-- opt.undofile = true
vim.opt.spell = false
vim.opt.spelloptions = "camel" -- Treat parts of camelCase words as seprate words
vim.opt.jumpoptions = "stack"
vim.opt.completeopt = "menu,menuone,noselect" -- show one element in menu selection and don't select it.

vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
