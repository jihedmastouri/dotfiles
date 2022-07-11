local g = vim.g
g.t_co = 256
g.background = "dark"

local cmd = vim.cmd
cmd [[
	autocmd VimEnter * silent! cd %:p:h
	autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
	autocmd User EasyMotionPromptBegin silent! CocDisable
	autocmd User EasyMotionPromptEnd silent! CocEnable
	]]
