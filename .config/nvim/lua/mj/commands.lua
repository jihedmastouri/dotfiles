-- commands.lua

local cmd = vim.cmd

-- Toggle diagnostic
Mj.toggleDiag = function()
	local bool = vim.diagnostic.get(virtual_text)
	vim.diagnostic.config({ virtual_text = not bool })
end
cmd([[command! TggD execute 'lua Mj.toggleDiag()' ]])
