local vertical_preview = { layout = 'vertical', vertical = 'down:75%' }

local fzf = function(_action, _opts)
  return function()
    local opts = vim.tbl_deep_extend('force', { copen = '' }, _opts or {})

    if opts.cwd then
      opts.cwd = vim.fn.expand("%:p:h")
    end

    local action = require('fzf-lua')[_action]

    return action(opts)
  end
end

local notes_tag_search = function()
  local fzf_lua = require('fzf-lua')

  fzf_lua.fzf_exec("rg '^#\\w+' --no-heading -IN | sort -u | uniq", {
    prompt = "tags>",
    actions = {
      ['default'] = function(selected, opts)
        fzf_lua.grep({ search = table.concat(selected, "|"), no_esc = true }, opts)
      end
    }
  })
end

return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      "<leader>f",
      "<leader>F",
      "<leader>b",
      "<leader>u",
      "<leader>g",
      "<leader>G",
      "<leader>p",
      "<leader>r",
      "<leader>d",
      "<leader>t",
      "<leader>i",
      "<leader>x",
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
    config = function(_, opts)
      local map = function(l, r, desc)
        vim.keymap.set('n', l, r, { desc = desc })
      end

      require('fzf-lua').setup(opts)

      map("<leader>f", fzf('files'), "Find files")
      map("<leader>F", fzf('files', { cwd = true }), "Search file under dir")
      map("<leader>b", fzf('buffers'), "Find buffers")
      map("<leader>u", fzf('builtin'), "Telescope builtin")
      map("<leader>g", fzf('live_grep'), "Live grep")
      map("<leader>G", fzf('live_grep', { cwd = true }), "Live grep under dir")
      map("<leader>p", fzf('grep_cword'), "Grep string under cursor")
      map("<leader>r", fzf('lsp_references'), "Find references")
      map("<leader>d", fzf('lsp_definitions', { jump_to_single_result = true }), "Find definitions")
      map("<leader>i", fzf('lsp_implementations', { jump_to_single_result = true }), "Find implementations")
      map("<leader>x", fzf('resume'), "Reopen last search")

      if vim.loop.cwd() == vim.fn.expand('~/notes') then
        map("<leader>t", notes_tag_search, "Find tags")
      else
        map("<leader>t", fzf('lsp_typedefs', { jump_to_single_result = true }), "Find type definitions")
      end
    end,
  },
}
