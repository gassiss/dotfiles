local nnoremap = require("gassiss/keymap").nnoremap
local telescope = require("telescope.builtin")

require("telescope").setup {}
require("telescope").load_extension("fzf")

nnoremap("<leader>ff", telescope.find_files)
nnoremap("<leader>fg", telescope.live_grep)
nnoremap("<leader>fw", telescope.grep_string)
nnoremap("<leader>fb", telescope.buffers)
nnoremap("<leader>fr", telescope.lsp_references)
nnoremap("<leader>fh", telescope.builtin)

-- diagnostics (can make this current buffer only. Change layout)
-- (maybe) lsp_{definitions,type_definitions,implementations} -> will use Telescope if there's more than one. Currently it opens a quickfix/locationlist
