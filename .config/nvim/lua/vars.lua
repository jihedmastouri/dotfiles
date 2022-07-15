local g = vim.g
g.t_co = 256
g.background = "dark"

local cmd = vim.cmd
cmd [[
	autocmd VimEnter * silent! cd %:p:h
	autocmd User EasyMotionPromptBegin silent! CocDisable
	autocmd User EasyMotionPromptEnd silent! CocEnable
	autocmd CursorHold * silent call CocActionAsync('highlight')
	]]

	g.vimspector_enable_mappings = 'HUMAN'
	g.vimspector_install_gadgets = { 'debugpy', 'vscode-go', 
	'CodeLLDB', 'vscode-node-debug2' }

-- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
