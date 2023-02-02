return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "go",
          "typescript",
          "javascript",
          "tsx",
          "vim",
          "yaml",
          "scss",
          "python",
          "dockerfile",
          "c",
          "json",
          "norg",
          "yaml",
          "markdown",
          "markdown_inline",
          "fish",
          "jsonnet",
        },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function (_, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 2000
          end
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = false,
            node_incremental = "<C-K>",
            scope_incremental = false,
            node_decremental = "<C-J>",
          }
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    keys = {
      { '<leader>ct', '<cmd>TSContextEnable<cr>', desc = "TSContext Toggle" },
    },
    opts = {
      max_lines = 5,
    },
  },
}
