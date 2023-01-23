local ls = require("luasnip")

local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local parse = ls.parser.parse_snippet

local f = ls.function_node

return {
  parse("li", "[$1]($2)"),
  s(
    "now",
    f(function()
      return os.date("%D - %H:%M")
    end)
  ),
}
