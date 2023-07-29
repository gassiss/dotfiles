local vertical_preview = { layout = 'vertical', vertical = 'down:75%' }

-- Command A: takes a tag and rg's the codebase for the occurrences of it. live_grep the result
-- Command B: rg's to return unique tag list in the folder. Feed list into fzf for fuzzy matching. run Command A on the selected tag
-- Command C: run command A on tag under cursor
--
local fzf = function (action, _opts)
  return function()
    local opts = vim.tbl_deep_extend('force', { copen = '' }, _opts or {})
    local act = require('fzf-lua')[action]

    return act({ copen = '' }, opts)
  end
end

return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>f", fzf('files'), desc = "Find files" },
      { "<leader>F", fzf('files', { cwd = vim.fn.expand("%:p:h") }), desc = "Search file under dir" },
      { "<leader>b", fzf('buffers'), desc = "Find buffers" },
      { "<leader>u", fzf('builtin'), desc = "Telescope builtin" },
      { "<leader>g", fzf('live_grep'), desc = "Live grep" },
      { "<leader>G", fzf('live_grep', { cwd = vim.fn.expand("%:p:h") }), desc = "Live grep under dir" },
      { "<leader>p", fzf('grep_cword'), desc = "Grep string under cursor" },
      { "<leader>r", fzf('lsp_references'), desc = "Find references" },
      { "<leader>d", fzf('lsp_definitions jump_to_single_result=true'), desc = "Find definitions" },
      { "<leader>t", fzf('lsp_typedefs jump_to_single_result=true'), desc = "Find type definitions" },
      { "<leader>i", fzf('lsp_implementations jump_to_single_result=true'), desc = "Find implementations" },
      { "<leader>x", fzf('resume'), desc = "Reopen last telescope search" },
    },
    -- update actions shortcuts
    -- * toggle all
    -- * preview down/up
    opts = {
      keymap = {
        fzf = {
          ['ctrl-t'] = 'toggle-all',
        }
      },
      files = { winopts = { preview = { hidden = 'hidden' } } },
      grep = { winopts = { preview = vertical_preview } },
      buffers = { winopts = { preview = vertical_preview } },
      diagnostics = { winopts = { preview = vertical_preview } },
      lsp = { winopts = { preview = vertical_preview } },
    },
    config = function(_, opts)
      local fzflua = require('fzf-lua')

      fzflua.setup(vim.tbl_deep_extend('force', opts, {
        octions = {
          files = {
            ['default'] = function(selected, options) fzflua.actions.file_edit_or_qf(selected,
                vim.tbl_deep_extend('force', { copen = nil }, options)) end } }
      }))
    end,
  },
}
