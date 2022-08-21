local nnoremap = require("gassiss.keymap").nnoremap
local vnoremap = require("gassiss.keymap").vnoremap

require('gitsigns').setup{
  numhl = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    nnoremap(']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true,buffer=bufnr})
    nnoremap('[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true,buffer=bufnr})

    nnoremap('<leader>hs', ':Gitsigns stage_hunk<CR>')
    vnoremap('<leader>hs', ':Gitsigns stage_hunk<CR>')
    nnoremap('<leader>hr', ':Gitsigns reset_hunk<CR>')
    vnoremap('<leader>hr', ':Gitsigns reset_hunk<CR>')
    nnoremap('<leader>hS', gs.stage_buffer)
    nnoremap('<leader>hu', gs.undo_stage_hunk)
    -- resets all hunks (undo the changes)
    nnoremap('<leader>hR', gs.reset_buffer)
    -- does git reset in the buffer
    nnoremap('<leader>hU', gs.reset_buffer_index)
    nnoremap('<leader>hp', gs.preview_hunk)
    nnoremap('<leader>hb', function() gs.blame_line{full=true} end)
    nnoremap('<leader>tb', gs.toggle_current_line_blame)
    nnoremap('<leader>hd', function() gs.diffthis('~') end)
    nnoremap('<leader>htd', gs.toggle_deleted)
    nnoremap('<leader>ha', function() gs.setqflist("all") end)
    nnoremap('<leader>hb', gs.setqflist)
  end
}
