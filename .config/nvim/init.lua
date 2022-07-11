-- Leader
vim.g.mapleader = "\\<Space>"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- COMPELETION
require('plugConfig.compe')

-- LSP CONFIGURATION
require('lsp.go')
require('lsp.python')
require('lsp.js')


-- require('lsp.csharp')
--require('lsp.lua')
--require('lsp.csharp')

-- PLUGINS CONFIGURATION IMPORTS
require('plugConfig.telescope')

-- SIMPLE PLUGIN SETUP
