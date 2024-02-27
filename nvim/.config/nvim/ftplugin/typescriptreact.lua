function format()
  local filename = vim.api.nvim_buf_get_name(0);
  local escaped = string.gsub(string.gsub(filename, "%(", "\\("), "%)", "\\)");
  vim.cmd('!npx prettier -w ' .. escaped);
end
vim.keymap.set('n', '<leader>&', format);
