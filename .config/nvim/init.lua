-- Leader
vim.g.mapleader = "<space>"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- COMPLETION
vim.o.completeopt = "menuone,noselect"

-- LSP
require('lsp.go')
require('lsp.python')
require('lsp.js')
require('lsp.csharp')
--require('lsp.lua')
--require('lsp.csharp')

-- PLUGINS CONFIGURATION IMPORTS
require('plugConfig.telescope')

-- SIMPLE PLUGIN SETUP
