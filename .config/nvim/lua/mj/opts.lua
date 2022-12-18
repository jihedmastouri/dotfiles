local opt = vim.opt

-- opt.undofile = true
opt.spelloptions = "camel" -- Treat parts of camelCase words as seprate words
opt.jumpoptions = "stack"
opt.completeopt = "menu,menuone,noselect" -- Dunno what's this

opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- My Variables
_G.Mj = {}
Mj.autoFormatter = false
