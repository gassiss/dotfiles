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
        },
        sync_install = false,
        auto_install = false,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
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
    event = "BufReadPost",
    opts = {
      max_lines = 5,
    },
  },
}
