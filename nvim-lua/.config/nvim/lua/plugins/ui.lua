return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "gruvbox",
        icons_enabled = false,
      },
      sections = {
        lualine_y = { "hostname" },
      },
    },
  },
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    config = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require('which-key').setup({})
    end
  }
}
