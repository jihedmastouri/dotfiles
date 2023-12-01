local ls = require("luasnip")

ls.setup({
  history = true,
  region_check_events = "CursorHold,InsertLeave",
  delete_check_events = "TextChanged,InsertEnter",
  enable_autosnippets = true,
  store_selection_keys = "<c-s>",
})

ls.filetype_extend("typescript", {"javascriptreact", "typescriptreact"})

require("luasnip.loaders.from_vscode").lazy_load()
