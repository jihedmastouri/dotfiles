local ls = require("luasnip")

ls.setup({
  history = true,
  region_check_events = "CursorHold,InsertLeave",
  delete_check_events = "TextChanged,InsertEnter",
  enable_autosnippets = true,
  store_selection_keys = "<c-s>",
})

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend({"javascript", "typescript"}, {"javascriptreact", "typescriptreact"})
ls.filetype_extend({"javascriptreact", "typescriptreact"}, { "javascript", "typescript" })

require("luasnip.loaders.from_vscode").lazy_load()
