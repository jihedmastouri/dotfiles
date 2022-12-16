local opt = vim.opt

-- opt.undofile = true
opt.spelloptions = "camel" -- Treat parts of camelCase words as seprate words
opt.jumpoptions = "stack"
opt.completeopt = menu,menuone,noselect -- Dunno what's this

-- opt.foldlevel = 20
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- My Variables
_G.mj = {}
mj.autoFormatter = false
