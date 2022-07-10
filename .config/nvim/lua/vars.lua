local g = vim.g
g.t_co = 256
g.background = "dark"

local cmd = vim.cmd
cmd [[
	autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll                      
	autocmd VimEnter * silent! cd %:p:h
	]]
