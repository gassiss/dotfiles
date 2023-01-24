local ls = require('luasnip')

local s, i, c, t, sn = ls.s, ls.insert_node, ls.choice_node, ls.text_node, ls.snippet_node
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    "t",
    fmt("<{}>{}</{}>", { i(1), i(0), rep(1) })
  ),
}
