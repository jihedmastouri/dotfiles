g = vim.g
cmd = vim.cmd
opt = vim.opt

-- Shared Settings
cmd [[
	source ~/.config/nvim/sharedVim/opts.vim
	source ~/.config/nvim/sharedVim/keys.vim
]]

-- Options
opt.foldexpr = "nvim_treesitter#foldexpr()"


-- Variables
g.airline_theme='deus'

g.vimspector_enable_mappings = 'HUMAN'
g.vimspector_install_gadgets = {'debugpy','vscode-go','CodeLLDB','vscode-node-debug2'}

g.tokyonight_transparent = true
g.tokyonight_colors = {hint="orange", error="#ff0000", bg_float="none"}
g.tokyonight_style = "night"

-- Theme
cmd [[
		colorscheme tokyonight
	    autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
	]]

-- IMPORTS
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- Commands

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

-- PLUGINS CONFIGURATION
require('plugins.telescope')
require('plugins.treesitter')
