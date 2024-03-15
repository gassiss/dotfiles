local function map(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { desc = desc, buffer = true })
end
--
-- map("n", "<leader>d", "\"= strftime('%Y-%m-%d')<C-M>p", "Print current ISO date into buffer")

vim.opt.conceallevel = 1

-- only works for external links
map("n", "<cr>", "<silent><cmd>normal mif(gx`i<cr>")
