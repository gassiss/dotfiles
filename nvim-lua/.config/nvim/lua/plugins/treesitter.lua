return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function ()
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
        },
        sync_install = false,
        auto_install = false,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "BufReadPost",
  }
}
