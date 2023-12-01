local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings:
--------------------

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "250" })
	end,
})

-- Set Workspace Dir
augroup("Welcome", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	group = "Welcome",
	callback = function()
		vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
	end,
	pattern = "*",
})

-- Return to last edit position when opening files
augroup("WelcomeBack", { clear = true })
autocmd("BufReadPost", {
	group = "WelcomeBack",
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.fn.setpos(".", vim.fn.getpos("'\""))
			vim.cmd("normal zz")
			vim.cmd("silent! foldopen")
		end
	end,
})

-- Don't Jump back to prvious sessions
augroup("WelcomeNew", { clear = true })
autocmd("VimEnter", {
	group = "WelcomeNew",
	pattern = "*",
	command = "clearjump",
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e",
})

-- format on save
autocmd("BufWritePre", {
	pattern = {
		"*.go",
		"*.rs",
	},
	command = "lua vim.lsp.buf.format()",
})


-- Don't auto commenting new lines
-- autocmd("BufEnter", {
--   pattern = "",
--   command = "set fo-=c fo-=r fo-=o",
-- })

--------------------------
-- Settings for filetypes:
--------------------------

-- Disable line length marker
augroup("setLineLength", { clear = true })
autocmd("Filetype", {
	group = "setLineLength",
	pattern = {
		"text",
		"markdown",
		"html",
		"xhtml",
		"typescriptreact",
		"javascriptreact",
		"astro",
	},
	command = "setlocal cc=0",
})

-- Set indentation to 2 spaces
augroup("setIndent", { clear = true })
autocmd("Filetype", {
  group = "setIndent",
  pattern = {
		"xml",
		"html",
		"xhtml",
		"css",
		"scss",
		"typescriptreact",
		"javascriptreact",
		"astro",
		"yaml",
		"json",
		"lua",
	},
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
})

-- Enable spell checking for certain file types
augroup("Deslyxic", { clear = true })
autocmd("Filetype", {
	group = "Deslyxic",
	pattern = { "text", "markdown", "latex", "json", "yaml" },
	command = "setlocal spell",
})
