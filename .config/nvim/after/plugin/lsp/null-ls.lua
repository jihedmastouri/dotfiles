local null = require("null-ls")
local f = { "stylua", "prettier" } -- Formatters
local c = {} -- Completion
local a = { "gitsigns" } -- Actions
local d = { "pylint", "yamllint" } -- diagnostics

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

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				if Mj.autoFormatter then
					lsp_formatting(bufnr)
				end
			end,
		})
	end
end

null.setup({
	sources = sources,
	on_attach = on_attach,
})
