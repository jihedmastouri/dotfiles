-- My Variables
_G.Mj = {}
Mj.autoFormatter = false

vim.g.mapleader = " "

diag_icons = {
	hint = " ",
	info = " ",
	warning = " ",
	error = " ",
}

-- Disable Default
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_man = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1

-- LSP settings
local float_style = {
	style = "minimal",
	border = "rounded",
	source = "always",
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_style)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_style)

local default_diagnostic_config = {
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diag_icons.error,
			[vim.diagnostic.severity.WARN]  = diag_icons.warning,
			[vim.diagnostic.severity.HINT]  = diag_icons.hint,
			[vim.diagnostic.severity.INFO]	= diag_icons.info,
		},
	},
	virtual_lines = false,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = float_style,
}

vim.diagnostic.config(default_diagnostic_config)
