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
          "terraform",
          "tsx",
          "vim",
          "yaml",
          "scss",
          "python",
          "dockerfile",
          "c",
          "json",
          "rust",
          "yaml",
          "markdown",
          "markdown_inline",
          "jsonnet",
          "fish",
          "bash",
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
      })

    vim.keymap.set('n', '<leader>ct', '<cmd>TSContextToggle<cr>')
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { max_lines = 5, enable = false },
  },
}
