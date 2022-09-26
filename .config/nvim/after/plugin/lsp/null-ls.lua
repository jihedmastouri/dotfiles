local null = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local f = { "stylua", "prettier", "sql_formatter" }
local c = { "spell" }
local a = {}
local d = { "pylint", "misspell", "eslint_d" }

local sources = {}
for _, v in ipairs(f) do
	table.insert(sources, null.builtins.formatting[v])
end
for _, v in ipairs(c) do
	table.insert(sources, null.builtins.completion[v])
end
for _, v in ipairs(a) do
	table.insert(sources, null.builtins.code_actions[v])
end
for _, v in ipairs(d) do
	table.insert(sources, null.builtins.diagnostics[v])
end

null.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
					vim.api.nvim_command("write")
				end,
			})
		end
	end,
})
