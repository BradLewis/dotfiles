require("luasnip.session.snippet_collection").clear_snippets("rust")

local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("rust", {
  s(
    "logmaperr",
    fmta(
      [[
    map_err(|err| <level>!(error = %<err>, "<message>"));
  ]],
      {
        level = i(1, "error"),
        err = i(2, "err"),
        message = i(3),
      }
    )
  ),
  s(
    "error",
    fmta(
      [[
    error!(error = %<err>, "<message>");
  ]],
      {
        err = i(1, "err"),
        message = i(2),
      }
    )
  ),
  s(
    "log",
    fmta(
      [[
  <level>!("<message>");
  ]],
      {
        level = i(1, "info"),
        message = i(2),
      }
    )
  ),
  s(
    "template",
    fmta(
      [[
    #[derive(Template)]
    #[template(path = "<path>.html")]
    struct <name>Template<<'a>> {
        <fields>
    }
  ]],
      {
        path = i(1),
        name = i(2),
        fields = i(3),
      }
    )
  ),
  s(
    "derive",
    fmta(
      [[
      #[derive(<text>)]
      ]],
      {
        text = i(1),
      }
    )
  ),
  s(
    "struct",
    fmta(
      [[
  struct <name> {
      <fields>
  }
  ]],
      {
        name = i(1),
        fields = i(2),
      }
    )
  ),
})
