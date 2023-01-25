return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-k>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
        -- adds some icons to completion?
        -- formatting = {
        --   format = function(_, item)
        --     local icons = require("lazyvim.config").icons.kinds
        --     if icons[item.kind] then
        --       item.kind = icons[item.kind] .. item.kind
        --     end
        --     return item
        --   end,
        -- },
      }
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    opts = {
      history = true,
      delete_check_events = "TextChanged,TextChangedI",
    },
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup(opts)

      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/config/snippets" })

      ls.filetype_extend("javascript", { "typescript" })
      ls.filetype_extend("typescriptreact", { "typescript" })

      local function map(mode, l, r, optss)
        vim.keymap.set(mode, l, r, optss)
      end

      map("i", "<c-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      map("i", "<c-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      map("i", "<c-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })

      map("n", "<leader><leader>s", function()
        require("luasnip.loaders.from_lua").lazy_load({
          paths = "~/.config/nvim/lua/config/snippets",
        })
      end)

      map("n", "<leader><leader>e", function()
        require('luasnip.loaders').edit_snippet_files()
      end)
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      numhl = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", gs.next_hunk, "Next hunk")
        map("n", "[c", gs.prev_hunk, "Prev hunk")

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
        map("n", "<leader>ha", function() gs.setqflist("all") end, "Add all changes to Qfix")
        map("n", "<leader>hb", gs.setqflist, "Add current buffer changes to Qfix")
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
