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

-- Snippets
local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets("markdown", {
  snip({
      trig = "meta",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown"
    },
    {
      text({ "---",
        "title: " }), insert(1, "note_title"), text({ "",
      "author: " }), insert(2, "author"), text({ "",
      "date: " }), func(date, {}), text({ "",
      "categories: [" }), insert(3, ""), text({ "]",
      "lastmod: " }), func(date, {}), text({ "",
      "tags: [" }), insert(4), text({ "]",
      "comments: true",
      "---", "" }),
      insert(0)
    })
})

ls.filetype_extend("typescript", { "javascript" })



-- from https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua#L81-L166
-- hacked up for javascript and jsdoc
-- local function jsdoc(args)
--   local pstring = vim.trim(args[1][1])
--
--   local nodes = {
--     text({ "/**", " * " }),
--     r(1, "desc", insert(1, "A short Description")),
--     text({ "", "" }),
--   }
--
--   -- At least one param.
--   if #pstring > 0 then
--     vim.list_extend(nodes, { text({ " * ", "" }) })
--   end
--
--   local inserted = 2
--   for arg in string.gmatch(pstring, '%w+') do
--     local inode = r(inserted, "arg" .. arg, insert(1, "any"))
--     vim.list_extend(nodes, { text({ " * @param {" }), inode, text({ "} " .. arg .. " ", "" }) })
--     inserted = inserted + 1
--   end
--
--   vim.list_extend(nodes,
--     {
--       text({ " * @returns {" }),
--       r(inserted, "returns", insert(1, "void")),
--       text({ "} ", "" })
--     })
--   vim.list_extend(nodes, { text({ " */" }) })
--
--   local temp_snip = node(nil, nodes)
--   return temp_snip
-- end
--
-- ls.add_snippets("javascript", {
--   snip("jf", {
--     dynamicn(4, jsdoc, 3), -- generate the jsdoc
--     text({ "", "" }),
--     choice(1, {            -- choose function or method
--       text({ "function " }),
--       text({ "" })
--     }),
--     insert(2, "name"), -- give it a name
--     text("("),
--     insert(3),         -- parameters
--     text(")"),
--     text({ " {", "\t" }),
--     insert(0), -- body
--     text({ "", "}" }),
--   }),
-- })

require("luasnip.loaders.from_vscode").lazy_load()
