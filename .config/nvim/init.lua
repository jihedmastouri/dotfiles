------ _       _ __                      _
----- (_)___  (_) /_         ____ _   __(_)___ ___
---- / / __ \/ / __/        / __ \ | / / / __ `__ \
--- / / / / / / /_    _    / / / / |/ / / / / / / /
-- /_/_/ /_/_/\__/   (_)  /_/ /_/|___/_/_/ /_/ /_/

-- SHARED SETTINGS
vim.cmd([[
	source ~/.config/nvim/sharedVim/opts.vim
	source ~/.config/nvim/sharedVim/keys.vim
	source ~/.config/nvim/sharedVim/not-idea.vim
]])

-- IMPORTS
require("mj.opts") -- Options
require("mj.keys") -- Keymaps
require("mj.commands") -- Command & conquer
require("mj.plugs") -- Plugins
require("mj.vars") -- Variables
