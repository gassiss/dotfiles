return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
      require('which-key').setup({})
    end
  },
  {
    'stevearc/dressing.nvim',
    event = "BufReadPre",
  },
}
