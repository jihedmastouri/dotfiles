-- to be fixed later

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("editorconfig", {
    s("editorconfig", fmta([[
root = true

[*]
charset = utf-8
indent_style = space
indent_size = 2
end_of_line = lf
max_line_length = 100
insert_final_newline = true
trim_trailing_whitespace = true

[*.{js,ts,go,rs,py,sql,sh,hs}]
indent_style = tab
indent_size = 4
max_line_length = 80

[{Makefile,go.mod,go.sum,.gitmodules}]
indent_style = tab
indent_size = 4

[*.md]
indent_size = 4
trim_trailing_whitespace = false

]],{}))
})

-- prettier
ls.add_snippets("prettier", {
    s("prettier",
        fmta([[
{
  "singleQuote": true,
  "trailingComma": "es5"
}
]],{}))
})
