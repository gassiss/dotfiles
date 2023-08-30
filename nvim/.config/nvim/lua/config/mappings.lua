vim.g.mapleader = " "

-- jumping keeps buffer centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")

vim.keymap.set("n", "{", "[", { remap = true })
vim.keymap.set("n", "}", "]", { remap = true })

vim.keymap.set({ "n", "v" }, "&", "%")
vim.keymap.set({ "n", "v" }, "-", "_")
vim.keymap.set({ "n", "v" }, "_", "-")

vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Save file" })

-- remaps Y to behave like D
vim.keymap.set("n", "Y", "y$")

-- Increase/reduce vertical split size.
-- vim.keymap.set("n", "<silent> <a-,> :vertical resize", "-1<CR>")
-- vim.keymap.set("n", "<silent> <a-.> :vertical resize", "+1<CR>")
-- vim.keymap.set("n", "<silent> <a-<> :vertical resize", "-5<CR>")
-- vim.keymap.set("n", "<silent> <a->> :vertical resize", "+5<CR>")

-- Increase/reduce horizontal split size.
-- vim.keymap.set("n", "<silent> <a--> :resize", "-1<CR>")
-- vim.keymap.set("n", "<silent> <a-=> :resize", "+1<CR>")
-- vim.keymap.set("n", "<silent> <a-_> :resize", "-5<CR>")
-- vim.keymap.set("n", "<silent> <a-+> :resize", "+5<CR>")

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>yy", '"+yy')

vim.keymap.set("n", "]f", ":cnext<CR>zz", { desc = "Next in quick fix" })
vim.keymap.set("n", "<c-j>", ":cnext<CR>zz", { desc = "Next in quick fix" })
vim.keymap.set("n", "[f", ":cprev<CR>zz", { desc = "Prev in quick fix" })
vim.keymap.set("n", "<c-k>", ":cprev<CR>zz", { desc = "Prev in quick fix" })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Close quick fix" })
vim.keymap.set("n", "<leader>co", ":copen 5<CR>", { desc = "Open quick fix" })

-- tabs
vim.keymap.set("n", "<C-w><C-n>", ":tabnew %<CR>")

-- Paste from system clipboard
-- vim.keymap.set("n", "<leader>y", '"+p')
-- vim.keymap.set("n", "<leader>P", '"+P')
-- vim.keymap.set("v", "<leader>p", '"+p')
-- vim.keymap.set("v", "<leader>P", '"+P')
-- Delete without sending to register
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- tabs and windows
vim.keymap.set("n", "sn", ":tabnew %<CR>")
vim.keymap.set("n", "sq", "<C-w>q")
vim.keymap.set("n", "sa", "1gt")
vim.keymap.set("n", "so", "2gt")
vim.keymap.set("n", "se", "3gt")
vim.keymap.set("n", "su", "4gt")
vim.keymap.set("n", "si", "5gt")
vim.keymap.set("n", "<c-l>", "<c-w><c-w>")

vim.keymap.set("n", "<C-h>", "<c-^>")
vim.keymap.set("n", "<leader>-", "<cmd>Ex<cr>")
-- vim.keymap.set("i", "<C-l>", "<C-o>O")
-- vim.keymap.set("n", "<C-l>", "mlO<Esc>`l") -- insert new line above cursor
-- vim.keymap.set("n", "<CR>", "mlo<Esc>`l") -- insert new line under cursor
-- vim.cmd [[nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : 'mlo<Esc>`l']]
vim.keymap.set("i", "<C-y>", '<cmd>set paste<cr><C-r>"<cmd>set nopaste<cr>')
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set('i', '{!', '{<cr>}<esc>O')
vim.keymap.set('i', '{+', '{<space>}<left><left><space>')
vim.keymap.set('i', '[!', '[<cr>]<esc>O')
vim.keymap.set('i', '[+', '[<space>]<left><left><space>')
