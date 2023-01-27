local vertical_layout =
{ layout_strategy = "vertical", layout_config = { width = 0.85, preview_height = 0.7 } }

-- stylua: ignore start
return {
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>F", function()
        require('telescope.builtin').find_files({ cwd = vim.fn.expand("%:p:h") })
      end, desc = "Search file under dir" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>u", "<cmd>Telescope builtin<cr>", desc = "Telescope builtin" },
      { "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>G", function()
        require('telescope.builtin').live_grep({ cwd = vim.fn.expand("%:p:h") })
      end, desc = "Live grep under dir" },
      { "<leader>p", "<cmd>Telescope grep_string<cr>", desc = "Grep string under cursor" },
      { "<leader>r", "<cmd>Telescope lsp_references<cr>", desc = "Find references" },
      { "<leader>d", "<cmd>Telescope lsp_definitions<cr>", desc = "Find definitions" },
      { "<leader>t", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Find type definitions" },
      { "<leader>i", "<cmd>Telescope lsp_implementations<cr>", desc = "Find implementations" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "^.git/" },
        mappings = {
          i = {
            ['<C-q>'] = 'smart_add_to_qflist',
            ['<up>'] = 'cycle_history_prev',
            ['<down>'] = 'cycle_history_next',
          },
        },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = vertical_layout,
        grep_string = vertical_layout,
        lsp_references = vertical_layout,
        lsp_definitions = vertical_layout,
        lsp_type_definitions = vertical_layout,
        lsp_implementations = vertical_layout,
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Add to harpoon" },
      { "<leader>ch", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon toggle quick menu" },
      { "<C-h>", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon file 1" },
      { "<C-t>", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon file 2" },
      { "<C-n>", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon file 3" },
      { "<C-s>", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon file 4" },
    },
    opts = { menu = { width = vim.api.nvim_win_get_width(0) - 20 } },
    config = true,
  },
}
