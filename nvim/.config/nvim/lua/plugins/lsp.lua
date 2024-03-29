local function config(_opts)
  local opts = _opts or {}
  return vim.tbl_deep_extend("force", {
    on_attach = function(_, bufnr)
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "grd", function()
        vim.diagnostic.setqflist({ open = false })
      end, "Show diagnostic of current buffer in QFlist")
      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gt", vim.lsp.buf.type_definition, "Go to type definiton")
      map("n", "grr", vim.lsp.buf.references, "References in quickfix list")
      map("n", "grn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "K", vim.lsp.buf.hover, "Show hover")
      map("i", "<C-j>", vim.lsp.buf.signature_help, "Show signature help")
      map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      map("n", "<leader>l", vim.diagnostic.open_float, "Open float")
      -- map("n", "<leader>&", vim.lsp.buf.format, "Format file")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    end,
  }, opts)
end

return {
  { "nvim-lua/plenary.nvim",   lazy = true },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
      -- npm install -g typescript typescript-language-server
      require("lspconfig").tsserver.setup(config())
      -- npm i -g vscode-langservers-extracted
      require("lspconfig").eslint.setup({})
      -- go install golang.org/x/tools/gopls@latest
      require("lspconfig").gopls.setup(config())
      -- go install github.com/grafana/jsonnet-language-server@latest
      require("lspconfig").jsonnet_ls.setup(config())
      -- rustup component add rust-analyzer
      require("lspconfig").rust_analyzer.setup(config())

      local function location_handler(_, result, ctx)
        local util = require("vim.lsp.util")

        if not result or vim.tbl_isempty(result) then
          vim.notify("No references found")
        else
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          config = config or {}
          vim.fn.setqflist({}, " ", {
            title = "References",
            items = util.locations_to_items(result, client.offset_encoding),
            context = ctx,
          })
        end
      end

      vim.lsp.handlers["textDocument/references"] = location_handler
    end,
  },
}
