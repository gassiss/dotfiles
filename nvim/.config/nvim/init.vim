" set leader key
let mapleader=" "

runtime ./plugins.vim
runtime ./general.vim
runtime ./mappings.vim

" fixes typos. Might be interesting
" iab wiht with

" Automatically removes trailling white space on save
autocmd BufWritePre * %s/\s\+$//e

