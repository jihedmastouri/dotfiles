-- Leader
vim.g.mapleader = "<space>"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- COMPELETION
-- Something .... :/
 
--require("luasnip.loaders.from_vscode").lazy_load({ paths = { "epicSnips" } })

-- PLUGINS CONFIGURATION IMPORTS
require('plugConfig.telescope')

-- SIMPLE PLUGIN SETUP
