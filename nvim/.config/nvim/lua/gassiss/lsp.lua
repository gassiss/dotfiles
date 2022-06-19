function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local nnoremap = bind("n")
local inoremap = bind("i")
local vnoremap = bind("v")

local function config(opts)
		return vim.tbl_deep_extend("force", {
		on_attach = function()
			print("yo attach")
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

-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup(config())
-- npm i -g vscode-langservers-extracted
require("lspconfig").eslint.setup{}

