------ _       _ __                      _
----- (_)___  (_) /_         ____ _   __(_)___ ___
---- / / __ \/ / __/        / __ \ | / / / __ `__ \
--- / / / / / / /_    _    / / / / |/ / / / / / / /
-- /_/_/ /_/_/\__/   (_)  /_/ /_/|___/_/_/ /_/ /_/

local cmd = vim.cmd

-- SHARED SETTINGS
cmd([[
	source ~/.config/nvim/sharedVim/opts.vim
	source ~/.config/nvim/sharedVim/keys.vim
	source ~/.config/nvim/sharedVim/not-idea.vim
]])

-- IMPORTS
require("mj.opts") -- Options
require("mj.keys") -- Keymaps
require("mj.plugs") -- Plugins
require("mj.vars") -- Variables

-- COMMANDS
cmd([[
	augroup Mj
		autocmd!
		autocmd VimEnter * silent! cd %:p:h
		autocmd FileType json syntax match Comment +\/\/.\+$+
	augroup END
	imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
]])
