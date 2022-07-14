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

-- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
