------ _       _ __                      _
----- (_)___  (_) /_         ____ _   __(_)___ ___
---- / / __ \/ / __/        / __ \ | / / / __ `__ \
--- / / / / / / /_    _    / / / / |/ / / / / / / /
-- /_/_/ /_/_/\__/   (_)  /_/ /_/|___/_/_/ /_/ /_/ 

local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- SHARED SETTINGS
cmd [[
	source ~/.config/nvim/sharedVim/opts.vim
	source ~/.config/nvim/sharedVim/keys.vim
]]

-- IMPORTS
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- OPTIONS
opt.foldmethod='manual'
opt.list = true
-- opt.foldmethod='expr'
-- opt.foldexpr="nvim_treesitter#foldexpr()"

-- VARIABLES
g.vimspector_enable_mappings = 'HUMAN'
g.vimspector_install_gadgets = {'debugpy','vscode-go','CodeLLDB','vscode-node-debug2'}


-- COMMANDS
cmd [[
	augroup Mj
		autocmd!
		autocmd VimEnter * silent! cd %:p:h
		autocmd User EasyMotionPromptBegin silent! CocDisable
		autocmd User EasyMotionPromptEnd silent! CocEnable
		autocmd CursorHold * silent call CocActionAsync('highlight')
		autocmd FileType json syntax match Comment +\/\/.\+$+
		autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
	augroup END
]]
