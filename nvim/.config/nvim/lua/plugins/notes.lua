-- vim.cmd[[
-- let g:vimwiki_list = [{'path': '~/notes/',
--                       \ 'syntax': 'markdown', 'ext': '.md'}]
-- ]]
--
-- vim.g.wiki_mappings_use_defaults = 'none'
-- vim.cmd[[
--   let g:wiki_mappings_local = {
--       \ '<plug>(wiki-graph-find-backlinks)' : '',
--       \ '<plug>(wiki-graph-related)' : '',
--       \ '<plug>(wiki-graph-check-links)' : '',
--       \ '<plug>(wiki-graph-check-links-g)' : '',
--       \ '<plug>(wiki-graph-in)' : '',
--       \ '<plug>(wiki-graph-out)' : '',
--       \ '<plug>(wiki-link-toggle)' : '',
--       \ '<plug>(wiki-page-delete)' : '',
--       \ '<plug>(wiki-page-rename)' : '',
--       \ '<plug>(wiki-page-toc)' : '',
--       \ '<plug>(wiki-page-toc-local)' : '',
--       \ '<plug>(wiki-export)' : '',
--       \ '<plug>(wiki-link-show)' : '',
--       \ '<plug>(wiki-link-extract-header)' : '',
--       \ '<plug>(wiki-tag-list)' : '',
--       \ '<plug>(wiki-tag-reload)' : '',
--       \ '<plug>(wiki-tag-rename)' : '',
--       \ '<plug>(wiki-tag-search)' : '',
--       \}
-- ]]

return {
  {
    "jakewvincent/mkdnflow.nvim",
    cond = function()
      return vim.loop.cwd() == "/home/gassis/notes"
    end,
    opts = {
      perspective = {
        priority = "root",
        root_tell = "index.md",
        fallback = "current",
      },
      mappings = {
        MkdnFoldSection = false,
        MkdnUnfoldSection = false,
        MkdnIncreaseHeading = false,
        MkdnDecreaseHeading = false,
        MkdnToggleToDo = { { "n", "v" }, "<C-t>" },
      },
      links = {
        transform_explicit = function(text)
          text = text:gsub(" ", "-")
          text = text:lower()
          return text
        end,
      },
    },
  },
  -- { "vimwiki/vimwiki" }
  -- {
  --   "lervag/wiki.vim",
  --   cond = function ()
  --     return vim.loop.cwd() == "/home/gassis/notes"
  --   end,
  --   config = function ()
  --     vim.g.wiki_root = "~/notes"
  --     vim.g.wiki_filetypes = { 'md' }
  --     vim.g.wiki_link_extension = '.md'
  --     vim.g.wiki_link_target_type = 'md'
  --
  --     vim.keymap.set({ "n", "x" }, "<cr>", "<cmd>WikiLinkFollow<cr>")
  --     vim.keymap.set("n", "<bs>", "<cmd>WikiLinkReturn<cr>")
  --     vim.keymap.set("n", "<home>", "<cmd>WikiJournal<cr>")
  --     vim.keymap.set("n", "<down>", "<cmd>WikiJournalNext<cr>")
  --     vim.keymap.set("n", "<up>", "<cmd>WikiJournalPrev<cr>")
  --     vim.keymap.set("n", "[n", "<cmd>WikiLinkPrev<cr>")
  --     vim.keymap.set("n", "]n", "<cmd>WikiLinkNext<cr>")
  --
  --     vim.api.nvim_create_autocmd("BufEnter", {
  --       group = vim.api.nvim_create_augroup("Wiki", {}),
  --       pattern = "*",
  --       command = "WikiEnable",
  --     })
  --   end,
  -- },
  -- {
  --   "junegunn/fzf",
  --   cond = function ()
  --     return vim.loop.cwd() == "/home/gassis/notes"
  --   end,
  -- }
}
