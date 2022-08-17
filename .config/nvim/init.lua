------ _       _ __                      _
----- (_)___  (_) /_         ____ _   __(_)___ ___
---- / / __ \/ / __/        / __ \ | / / / __ `__ \
--- / / / / / / /_    _    / / / / |/ / / / / / / /
-- /_/_/ /_/_/\__/   (_)  /_/ /_/|___/_/_/ /_/ /_/

local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- Variables
g.loaded_logiPat           = 1
g.loaded_rrhelper          = 1
g.loaded_tarPlugin         = 1
g.loaded_man               = 1
g.loaded_gzip              = 1
g.loaded_zipPlugin         = 1
g.loaded_2html_plugin      = 1
g.loaded_shada_plugin      = 1
g.loaded_spellfile_plugin  = 1
g.loaded_netrw             = 1
g.loaded_netrwPlugin       = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_remote_plugins    = 1

-- SHARED SETTINGS
cmd [[
	source ~/.config/nvim/sharedVim/opts.vim
	source ~/.config/nvim/sharedVim/keys.vim
]]

-- IMPORTS
require('mj.keys')      -- Keymaps
require('mj.plug')      -- Plugins

-- OPTIONS
opt.foldmethod='manual'
opt.list = true

-- VARIABLES
g.nocompatible = true
g.vimspector_enable_mappings = 'HUMAN'
g.vimspector_install_gadgets = {'debugpy','vscode-go','CodeLLDB','vscode-node-debug2'}

 -- COMMANDS
cmd [[
	augroup Mj
		autocmd!
		autocmd VimEnter * silent! cd %:p:h
		autocmd FileType json syntax match Comment +\/\/.\+$+
		autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
	augroup END
]]
