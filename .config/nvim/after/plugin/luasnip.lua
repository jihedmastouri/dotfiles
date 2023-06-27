local ls = require("luasnip")

-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local node = ls.snippet_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local r = ls.restore_node

ls.setup({
  history = true,
  region_check_events = "CursorHold,InsertLeave",
  delete_check_events = "TextChanged,InsertEnter",
  enable_autosnippets = true,
})

ls.filetype_extend("typescript", { "javascript" })

require("luasnip.loaders.from_vscode").lazy_load()
