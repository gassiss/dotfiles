vim.g.wiki_mappings_use_defaults = 'none'
vim.g.wiki_mappings_local = {
  ['<plug>(wiki-link-next)'] = '<c-j>',
  ['<plug>(wiki-link-prev)'] = '<c-k>',
  ['<plug>(wiki-link-follow)'] = '<cr>',
  ['x_<plug>(wiki-link-transform-visual)'] = '<cr>',
}
vim.cmd [[
let g:wiki_link_creation = {
  \ 'md': {
  \   'link_type': 'md',
  \   'url_extension': '.md',
  \   'url_transform': { x ->
  \     substitute(tolower(x), '\s\+', '-', 'g') },
  \ },
  \}
]]

return {
  {
    "lervag/wiki.vim",
    cond = function()
      return vim.loop.cwd() == vim.fn.expand("~/notes")
    end,
    config = function()
      vim.keymap.set('n', '<c-h>', function()
        if vim.fn.exists(':WikiJournalPrev') == 0 then
          vim.cmd [[WikiJournal]]
        else
          vim.cmd [[WikiJournalPrev]]
        end
      end)
      vim.keymap.set('n', '<c-l>', function()
        if vim.fn.exists(':WikiJournalNext') == 0 then
          vim.cmd [[WikiJournal]]
        else
          vim.cmd [[WikiJournalNext]]
        end
      end)
      vim.keymap.set('n', '<leader>r', '<cmd>WikiToc<cr>')
    end
  }
}
