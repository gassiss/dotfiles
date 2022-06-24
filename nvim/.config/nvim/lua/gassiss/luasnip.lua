local inoremap = require("gassiss/keymap").inoremap
local nnoremap = require("gassiss/keymap").nnoremap
local ls = require("luasnip")

require("luasnip.loaders.from_lua").lazy_load({
  paths = "~/.config/nvim/lua/gassiss/snippets"
})

-- make typescript snippets available in JS
ls.filetype_extend("javascript", { "typescript" })

inoremap("<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

inoremap("<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

inoremap("<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

nnoremap("<leader><leader>s", require("luasnip.loaders").edit_snippet_files)
