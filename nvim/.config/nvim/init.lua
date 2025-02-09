------ _       _ __                      _
----- (_)___  (_) /_         ____ _   __(_)___ ___
---- / / __ \/ / __/        / __ \ | / / / __ `__ \
--- / / / / / / /_    _    / / / / |/ / / / / / / /
-- /_/_/ /_/_/\__/   (_)  /_/ /_/|___/_/_/ /_/ /_/

-- IMPORTS
require("mj.vars") -- Variables
require("mj.opts") -- Options
require("mj.keys") -- Keys
require("mj.autocmds") -- AutoCommands
require("mj.lazy") -- Plugins

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
