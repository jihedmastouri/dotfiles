local ls = require("luasnip")

-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

ls.setup({
  history = true,
  region_check_events = "CursorHold,InsertLeave",
  delete_check_events = "TextChanged,InsertEnter",
  enable_autosnippets = true,
  store_selection_keys = "<c-s>",
})

ls.filetype_extend("typescript", { "javascript" })

local date = function()
  return os.date("%Y-%m-%d")
end

require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets("go", {
  snip({
    trig = "fe",
    namr = "ErrorF",
    dscr = "fmt.Errorf",
  }, {
    text("fmt.Errorf(\""),
    insert(1, "error"),
    text("\", "),
    insert(2, "args"),
    text(")"),
    insert(0),
  }),
  snip({
    trig = "fs",
    namr = "Sprintf",
    dscr = "fmt.Sprintf",
  }, {
    text("fmt.Sprintf(\""),
    insert(1, "format"),
    text("\", "),
    insert(2, "args"),
    text(")"),
    insert(0),
  }),
})

ls.add_snippets("markdown", {
  snip({
    trig = "meta",
    namr = "Metadata",
    dscr = "Yaml metadata format for markdown",
  }, {
    text({ "---", "title: " }),
    insert(1, "note_title"),
    text({ "", "author: " }),
    insert(2, "author"),
    text({ "", "date: " }),
    func(date, {}),
    text({ "", "categories: [" }),
    insert(3, ""),
    text({ "]", "lastmod: " }),
    func(date, {}),
    text({ "", "tags: [" }),
    insert(4),
    text({ "]", "comments: true", "---", "" }),
    insert(0),
  }),
  snip({
    trig = "link",
    namr = "markdown_link",
    dscr = "Create markdown link [txt](url)",
  }, {
    text("["),
    insert(1),
    text("]("),
    func(function()
      return snip.env.TM_SELECTED_TEXT[1] or {}
    end, {}),
    text(")"),
    insert(0),
  }),
})
