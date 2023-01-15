local function config(_opts)
  local opts = _opts or {}
  return vim.tbl_deep_extend("force", {
    -- capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(_, bufnr)
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gt", vim.lsp.buf.type_definition, "Go to type definiton")
      map("n", "grr", vim.lsp.buf.references, "References in quickfix list")
      map("n", "grn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "K", vim.lsp.buf.hover, "Show hover")
      map("i", "<C-h>", vim.lsp.buf.signature_help, "Show signature help")
      map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      map("n", "<leader>vd", vim.diagnostic.open_float, "Open float")
      map("n", "<leader>%", vim.lsp.buf.format, "Format file")
    end,
  }, opts)
end

return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "williamboman/mason.nvim", config = true, lazy = true },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "tsserver",
        "gopls",
        "pylsp",
        "eslint",
        "rust_analyzer@nightly",
        "sumneko_lua",
      },
      automatic_installation = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      require("lspconfig").tsserver.setup(config())
      require("lspconfig").eslint.setup({})
      require("lspconfig").pylsp.setup(config())
      require("lspconfig").gopls.setup(config())
      require("lspconfig").rust_analyzer.setup(config())
      require("lspconfig").sumneko_lua.setup(config({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "require" },
            },
          },
        },
      }))
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
        },
      }
    end,
  },
}
