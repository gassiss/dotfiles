local vertical_preview = { layout = 'vertical', vertical = 'down:75%' }

-- stylua: ignore start
return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>f", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>F", function() require('fzf-lua').files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Search file under dir" },
      { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
      { "<leader>u", "<cmd>FzfLua builtin<cr>", desc = "Telescope builtin" },
      { "<leader>g", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>G", function()
        require('fzf-lua').live_grep({ cwd = vim.fn.expand("%:p:h") })
      end, desc = "Live grep under dir" },
      { "<leader>p", "<cmd>FzfLua grep_cword<cr>", desc = "Grep string under cursor" },
      { "<leader>r", "<cmd>FzfLua lsp_references<cr>", desc = "Find references" },
      { "<leader>d", "<cmd>FzfLua lsp_definitions jump_to_single_result=true<cr>", desc = "Find definitions" },
      { "<leader>t", "<cmd>FzfLua lsp_typedefs jump_to_single_result=true<cr>", desc = "Find type definitions" },
      { "<leader>i", "<cmd>FzfLua lsp_implementations jump_to_single_result=true<cr>", desc = "Find implementations" },
      { "<leader>x", "<cmd>FzfLua resume<cr>", desc = "Reopen last telescope search" },
    },
    opts = {
      files = { winopts = { preview = { hidden = 'hidden' } } },
      grep = { winopts = { preview = vertical_preview } },
      buffers = { winopts = { preview = vertical_preview } },
      diagnostics = { winopts = { preview = vertical_preview } },
      lsp = { winopts = { preview = vertical_preview } },
    }
  },
}
