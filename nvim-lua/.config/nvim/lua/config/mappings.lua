vim.g.mapleader = " "

-- jumping keeps buffer centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "*", "*zz")

vim.keymap.set("n", "<Leader>w", ":w<CR>")

-- remaps Y to behave like D
vim.keymap.set("n", "Y", "y$")

-- Increase/reduce vertical split size.
vim.keymap.set("n", "<silent> <a-,> :vertical resize", "-1<CR>")
vim.keymap.set("n", "<silent> <a-.> :vertical resize", "+1<CR>")
vim.keymap.set("n", "<silent> <a-<> :vertical resize", "-5<CR>")
vim.keymap.set("n", "<silent> <a->> :vertical resize", "+5<CR>")

-- Increase/reduce horizontal split size.
vim.keymap.set("n", "<silent> <a--> :resize", "-1<CR>")
vim.keymap.set("n", "<silent> <a-=> :resize", "+1<CR>")
vim.keymap.set("n", "<silent> <a-_> :resize", "-5<CR>")
vim.keymap.set("n", "<silent> <a-+> :resize", "+5<CR>")

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>yy", '"+yy')

vim.keymap.set("n", "]f", ":cnext<CR>")
vim.keymap.set("n", "[f", ":cprev<CR>")
vim.keymap.set("n", "<leader>cc", ":cclose<CR>")
vim.keymap.set("n", "<leader>co", ":copen<CR>")

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')
-- Delete without sending to register
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("v", "J :m", "'>+1<CR>gv=gv")
vim.keymap.set("v", "K :m", "'<-2<CR>gv=gv")

-- tabs
vim.keymap.set("n", "<C-w><C-n> :tabnew", "%<CR>")
vim.keymap.set("n", "<C-w><C-y>", "gT")
vim.keymap.set("n", "<C-w><C-u>", "gt")

-- buffer things
vim.keymap.set("n", "<BS>", "<c-^>")

vim.keymap.set("n", "-", "<cmd>Ex<cr>")
