" set leader key
let mapleader=" "

runtime ./plugins.vim
runtime ./general.vim
runtime ./mappings.vim

lua require("gassiss")

" Automatically removes trailling white space on save
autocmd BufWritePre * %s/\s\+$//e

