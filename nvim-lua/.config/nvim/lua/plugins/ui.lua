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
}
