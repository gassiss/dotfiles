" set leader key
let mapleader=","

source $HOME/.dotfiles/nvim/plugins.vim
source $HOME/.dotfiles/nvim/general.vim
source $HOME/.dotfiles/nvim/mappings.vim

" fixes typos. Might be interesting
" iab wiht with

" Automatically removes trailling white space on save
autocmd BufWritePre * %s/\s\+$//e

