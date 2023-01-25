local ls = require("luasnip")

local s, i, c, t, sn = ls.s, ls.insert_node, ls.choice_node, ls.text_node, ls.snippet_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "imp",
    fmt(
      [[
      import {} from '{}';
      ]],
      {
        c(2, {
          i(nil, "something"), -- default import
          sn(nil, fmt("{{ {} }}", i(1))),
          sn(nil, fmt("type {{ {} }}", i(1))),
          sn(nil, fmt("* as {}", i(1))),
        }),
        i(1),
      }
    )
  ),
  s(
    "fn",
    fmt(
      [[
      {}function {}({}) {{
        {}
      }}

      ]],
      { c(3, { t(""), t("async ") }), i(1), i(2), i(0) }
    )
  ),
  s(
    "()",
    fmt(
      [[
      {}({}) => {}
      ]],
      {
        c(3, { t(""), t("async ") }),
        i(1),
        c(
          2,
          {
            i(nil),
            sn(
              nil,
              fmt(
                [[
          {{
            {}
          }}
          ]]     ,
                i(1)
              )
            ),
          }
        ),
      }
    )
  ),
  s("c", fmt("{}const {} = {};\n{}", { c(3, { t(""), t("export ") }), i(1), i(2), i(0) })),
  s(
    "if",
    fmt(
      [[
      if ({}) {}
      ]],
      { i(1), c(2, { i(nil), sn(nil, fmt("{{\n\t{}\n}}", i(1))) }) }
    )
  ),
  s(
    "desc",
    fmt(
      [[
      describe("{}", {});
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    "it",
    fmt(
      [[
      it("{}", {});
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    "try",
    fmt(
      [[
      try {{
        {}
      }} catch(err) {{
        {}
      }}
      ]],
      { i(1), i(2) }
    )
  )
  -- s(
  --   "",
  --   fmt(
  --     [[
  --     ]],
  --     { }
  --   )
  -- )
}
