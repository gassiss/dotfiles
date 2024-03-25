local function map(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { desc = desc, buffer = true })
end
--
map("n", "<leader>d", "<cmd>r! date +\"\\%A \\%dth\"<cr>", "Print current ISO date into buffer")
map("n", "<leader>l", "ciw[<c-y>]()");

vim.opt.conceallevel = 1

-- only works for external links
map("n", "<cr>", "<silent><cmd>normal mif(gx`i<cr>")
