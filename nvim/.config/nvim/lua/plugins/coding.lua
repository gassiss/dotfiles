return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      'L3MON4D3/LuaSnip',
    },
    opts = function()
      local cmp = require("cmp")

      return {
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-k>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-i>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }),
        snippet = {
          expand = function (args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      numhl = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", gs.next_hunk, "Next hunk")
        map("n", "[c", gs.prev_hunk, "Prev hunk")
        map({ "n", "v" }, "]r", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        map({ "n", "v" }, "[r", gs.undo_stage_hunk, "Stage hunk")

        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        -- resets all hunks (undo the changes)
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
        -- does git reset in the buffer
        map("n", "<leader>hU", gs.reset_buffer_index, "Reset buffer index")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>ht", gs.toggle_current_line_blame, "Toggle current line blame")
        -- stylua: ignore start
        map("n", "<leader>hl", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>hd", function() gs.diffthis("~") end, "Diff this")
        -- map("n", "<leader>ha", function() gs.setqflist("all", { open = false, use_location_list = true }) end, "Add all changes to Qfix")
        -- map("n", "<leader>hb", function() gs.setqflist(0, { open = false, use_location_list = true }) end, "Add current buffer changes to Qfix")
        map("n", "<leader>ha", function() gs.setqflist("all", { open = false }) end, "Add all changes to Qfix")
        map("n", "<leader>hb", function() gs.setqflist(0, { open = false }) end, "Add current buffer changes to Qfix")
        -- stylua: ignore end
      end,
    },
  },

  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        comment_line = "<leader>o",
        comment = "<leader>o",
      },
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
}
