require("luasnip").config.setup({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
	enable_autosnippets = true,
})
require("luasnip.loaders.from_vscode").lazy_load()
