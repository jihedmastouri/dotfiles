------ _       _ __                      _
----- (_)___  (_) /_         ____ _   __(_)___ ___
---- / / __ \/ / __/        / __ \ | / / / __ `__ \
--- / / / / / / /_    _    / / / / |/ / / / / / / /
-- /_/_/ /_/_/\__/   (_)  /_/ /_/|___/_/_/ /_/ /_/

-- SHARED SETTINGS
vim.cmd([[
	source ~/.config/nvim/sharedVim/keys.vim
	source ~/.config/nvim/sharedVim/not-idea.vim
]])

-- IMPORTS
require("mj.autocmds") -- AutoCommands
require("mj.opts") -- Options
require("mj.lazy") -- Plugins
require("mj.vars") -- Variables

if vim.env.DARK_THEME == "1" then
	vim.o.background = "dark"
	vim.cmd("colorscheme sonokai")
else
	vim.o.background = "light"
	vim.cmd("colorscheme catppuccin-latte")
end

vim.cmd([[
	autocmd FileType make setlocal noexpandtab softtabstop=0
]])
