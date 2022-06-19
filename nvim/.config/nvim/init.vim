runtime ./general.vim
runtime ./plugins.vim
runtime ./mappings.vim

lua require("gassiss")

" Automatically removes trailling white space on save
autocmd BufWritePre * %s/\s\+$//e

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})

