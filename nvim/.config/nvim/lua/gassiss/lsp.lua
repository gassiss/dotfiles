-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup{
  on_attach = function ()
    vim.api.nvim_buf_set_keymap(0, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "grr", ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "grn", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "[d", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "]d", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "i", "<C-h>", ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>vd", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
    -- Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
  end
}
-- npm i -g vscode-langservers-extracted
require("lspconfig").eslint.setup{}
