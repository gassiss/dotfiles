-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup{
  on_attach = function ()
    vim.api.nvim_buf_set_keymap(0, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
    -- Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
  end
}
-- npm i -g vscode-langservers-extracted
require("lspconfig").eslint.setup{}
