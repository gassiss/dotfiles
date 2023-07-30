local vertical_preview = { layout = 'vertical', vertical = 'down:75%' }

-- Command A: takes a tag and rg's the codebase for the occurrences of it. live_grep the result
-- Command B: rg's to return unique tag list in the folder. Feed list into fzf for fuzzy matching. run Command A on the selected tag
-- Command C: run command A on tag under cursor
--
local fzf = function(action, _opts)
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
      { "<leader>f", fzf('files'),                                          desc = "Find files" },
      { "<leader>F", fzf('files', { cwd = vim.fn.expand("%:p:h") }),        desc = "Search file under dir" },
      { "<leader>b", fzf('buffers'),                                        desc = "Find buffers" },
      { "<leader>u", fzf('builtin'),                                        desc = "Telescope builtin" },
      { "<leader>g", fzf('live_grep'),                                      desc = "Live grep" },
      { "<leader>G", fzf('live_grep', { cwd = vim.fn.expand("%:p:h") }),    desc = "Live grep under dir" },
      { "<leader>p", fzf('grep_cword'),                                     desc = "Grep string under cursor" },
      { "<leader>r", fzf('lsp_references'),                                 desc = "Find references" },
      { "<leader>d", fzf('lsp_definitions jump_to_single_result=true'),     desc = "Find definitions" },
      { "<leader>t", fzf('lsp_typedefs jump_to_single_result=true'),        desc = "Find type definitions" },
      { "<leader>i", fzf('lsp_implementations jump_to_single_result=true'), desc = "Find implementations" },
      { "<leader>x", fzf('resume'),                                         desc = "Reopen last telescope search" },
    },
    opts = {
      keymap = {
        fzf = {
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
          ["ctrl-f"] = "forward-word",
          ["ctrl-b"] = "backward-word",
          ["ctrl-a"] = "beginning-of-line",
          ["ctrl-e"] = "end-of-line",
          ['ctrl-q'] = 'select-all+accept',
        },
        builtin = {
          ["<F1>"]     = "toggle-help",
          ["<F2>"]     = "toggle-fullscreen",
          ["<F3>"]     = "toggle-preview-wrap",
          ["<F4>"]     = "toggle-preview",
          ["<F5>"]     = "toggle-preview-ccw",
          ["<F6>"]     = "toggle-preview-cw",
          ["<C-d>"]    = "preview-page-down",
          ["<C-u>"]    = "preview-page-up",
          ["<S-left>"] = "preview-page-reset",
        },
      },
      files = { winopts = { preview = { hidden = 'hidden' } } },
      grep = { winopts = { preview = vertical_preview } },
      buffers = { winopts = { preview = vertical_preview } },
      diagnostics = { winopts = { preview = vertical_preview } },
      lsp = { winopts = { preview = vertical_preview } },
    },
  },
}
