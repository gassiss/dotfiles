local nnoremap = require("gassiss/keymap").nnoremap
local inoremap = require("gassiss/keymap").inoremap

local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
    { name = 'path' },
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

local function config(_opts)
    local opts = _opts or {}
		return vim.tbl_deep_extend("force", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
			on_attach = function()
				nnoremap("gd", vim.lsp.buf.definition)
				nnoremap("gt", vim.lsp.buf.type_definition)
				nnoremap("grr", vim.lsp.buf.references)
				nnoremap("grn", vim.lsp.buf.rename)
				nnoremap("K", vim.lsp.buf.hover)
				inoremap("<C-h>", vim.lsp.buf.signature_help)
				nnoremap("[d", vim.diagnostic.goto_prev)
				nnoremap("]d", vim.diagnostic.goto_next)
				nnoremap("<leader>l", vim.diagnostic.open_float)

        -- hack to enable formatting for typescript/javascript using prettier
        if opts["format"] then
          local function formatter()
            if vim.api.nvim_exec("echo &modified", true) == "1" then
              print("Save the buffer before formatting dumbass")
              return
            end
            opts.format()
            -- vim.api.nvim_command("write")
          end

          nnoremap("<leader>%", formatter)
        else
          nnoremap("<leader>%", vim.lsp.buf.formatting_sync)
        end

			end,
	}, opts)
end

require("lspconfig").tsserver.setup(config({
  format = function() vim.api.nvim_command("silent !yarn prettier --write %") end,
}))
require("lspconfig").eslint.setup{}
require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
        unreachable = true,
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))
require("lspconfig").pylsp.setup{}
require("lspconfig").rust_analyzer.setup(config({
  cmd = { "rustup", "run", "nightly", "rust-analyzer" }
}))
require("lspconfig").jsonnet_ls.setup(config())
