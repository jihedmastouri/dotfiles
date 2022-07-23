g = vim.g
cmd = vim.cmd

-- Shared Settings
cmd [[
	source ~/.config/nvim/sharedVim/opts.vim
	source ~/.config/nvim/sharedVim/keys.vim
]]

-- Theme
g.tokyonight_transparent=true
cmd [[ colorscheme tokyonight ]]
-- g.gruvbox_contrast=hard
-- g.gruvbox_dark=hard

-- IMPORTS
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- Variables
g.vimspector_enable_mappings = 'HUMAN'
g.vimspector_install_gadgets = { 'debugpy', 'vscode-go',
				                  'CodeLLDB', 'vscode-node-debug2' }
-- Commands

cmd [[
	augroup Mj
		autocmd!
		autocmd VimEnter * silent! cd %:p:h
		autocmd User EasyMotionPromptBegin silent! CocDisable
		autocmd User EasyMotionPromptEnd silent! CocEnable
		autocmd CursorHold * silent call CocActionAsync('highlight')
		autocmd FileType json syntax match Comment +\/\/.\+$+
	augroup END
	]]

-- PLUGINS CONFIGURATION
require('plugConfig.telescope')
