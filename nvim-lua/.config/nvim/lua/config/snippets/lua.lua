local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local f = ls.function_node
-- local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local parse = ls.parser.parse_snippet

return {
  s("req", fmt("local {} = require('{}')", { f(function (args)
    local parts = vim.split(args[1][1], ".", true)
    return parts[#parts] or ""
  end, { 1 }), i(1) })),

  parse(
    "sniph",
    [[
    local ls = require('luasnip')

    local s, i, t = ls.s, ls.insert_node, ls.text_node
    local fmt = require('luasnip.extras.fmt').fmt
    ]]
  ),
}
