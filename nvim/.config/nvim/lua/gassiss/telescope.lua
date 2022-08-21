local nnoremap = require("gassiss/keymap").nnoremap
local telescope = require("telescope.builtin")

local vertical_layout = {layout_strategy="vertical",layout_config={width=0.85,preview_height=0.7}}

require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "^.git/" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = vertical_layout,
    grep_string = vertical_layout,
    lsp_references = vertical_layout,
    lsp_definitions = vertical_layout,
    lsp_type_definitions = vertical_layout,
    lsp_implementations = vertical_layout,
  }
}
require("telescope").load_extension("fzf")


nnoremap("<leader>ff", telescope.find_files)
nnoremap("<leader>fb", telescope.buffers)
nnoremap("<leader>fh", telescope.builtin)
nnoremap("<leader>fg", telescope.live_grep)
nnoremap("<leader>fw", telescope.grep_string)
nnoremap("<leader>fc", telescope.command_history)
-- these are all bugged if you have more than one buffer split
nnoremap("<leader>fr", telescope.lsp_references)
nnoremap("<leader>fd", telescope.lsp_definitions)
nnoremap("<leader>ft", telescope.lsp_type_definitions)
nnoremap("<leader>fi", telescope.lsp_implementations)
nnoremap("<leader>fe", telescope.diagnostics)
nnoremap("<leader>fq", telescope.quickfix)
-- nnoremap("<leader>fq", function () telescope.diagnostics({ bufnr = 0 }) end)

