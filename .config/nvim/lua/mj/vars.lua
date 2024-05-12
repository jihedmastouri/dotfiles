-- My Variables
_G.Mj = {}
Mj.autoFormatter = false

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
local default_diagnostic_config = {
	virtual_text = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "rounded",
		source = "always",
	},
}

vim.diagnostic.config(default_diagnostic_config)

local signs = {
	{ name = "DiagnosticSignError", text = diag_icons.error },
	{ name = "DiagnosticSignWarn", text = diag_icons.warn },
	{ name = "DiagnosticSignHint", text = diag_icons.hint },
	{ name = "DiagnosticSignInfo", text = diag_icons.info },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
