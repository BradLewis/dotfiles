require("luasnip.session.snippet_collection").clear_snippets("go")

local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("go", {
  s(
    "iferr",
    fmta(
      [[
  if err != nil {
    return <result>
  }
  ]],
      {
        result = i(1, "err"),
      }
    )
  ),
  s(
    "fmterr",
    fmta(
      [[
  fmt.Errorf("<message>: %w", err)
  ]],
      {
        message = i(1),
      }
    )
  ),
})
