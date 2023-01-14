local vertical_layout = {layout_strategy="vertical",layout_config={width=0.85,preview_height=0.7}}

return {
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>' },
      { "<leader>fb", '<cmd>Telescope buffers<cr>'},
      { "<leader>fh", '<cmd>Telescope builtin<cr>'},
      { "<leader>fg", '<cmd>Telescope live_grep<cr>'},
      { "<leader>fw", '<cmd>Telescope grep_string<cr>'},
      { "<leader>fc", '<cmd>Telescope command_history<cr>'},
      { "<leader>fr", '<cmd>Telescope lsp_references<cr>'},
      { "<leader>fd", '<cmd>Telescope lsp_definitions<cr>'},
      { "<leader>ft", '<cmd>Telescope lsp_type_definitions<cr>'},
      { "<leader>fi", '<cmd>Telescope lsp_implementations<cr>'},
    },
    opts = {
      defaults = {
        file_ignore_patterns = { '^.git/' },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = vertical_layout,
        grep_string = vertical_layout,
        lsp_references = vertical_layout,
        lsp_definitions = vertical_layout,
        lsp_type_definitions = vertical_layout,
        lsp_implementations = vertical_layout,
      }
    },
    config = function (plugin, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('fzf')
    end,
  },
  {
    'ThePrimeagen/harpoon',
    keys = {
      { '<leader>a', function() require('harpoon.mark').add_file() end },
      { '<C-g>', function() require('harpoon.ui').toggle_quick_menu() end },
      { '<C-h>', function() require('harpoon.ui').nav_file(1) end },
      { '<C-t>', function() require('harpoon.ui').nav_file(2) end },
      { '<C-n>', function() require('harpoon.ui').nav_file(3) end },
      { '<C-s>', function() require('harpoon.ui').nav_file(4) end },
    },
    opts = { menu = { width = vim.api.nvim_win_get_width(0) - 20 } },
    config = true,
  },
}
