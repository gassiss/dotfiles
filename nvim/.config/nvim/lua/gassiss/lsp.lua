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

local function config(opts)
		return vim.tbl_deep_extend("force", {
			capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
			on_attach = function()
				nnoremap("gd", function() vim.lsp.buf.definition() end)
				nnoremap("gt", function() vim.lsp.buf.type_definition() end)
				nnoremap("grr", function() vim.lsp.buf.references() end)
				nnoremap("grn", function() vim.lsp.buf.rename() end)
				nnoremap("K", function() vim.lsp.buf.hover() end)
				inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
				nnoremap("[d", function() vim.diagnostic.goto_prev() end)
				nnoremap("]d", function() vim.diagnostic.goto_next() end)
				nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			end,
	}, opts or {})
end

require("lspconfig").tsserver.setup(config())
require("lspconfig").eslint.setup{}
require("lspconfig").gopls.setup(config())
require("lspconfig").pylsp.setup{}
