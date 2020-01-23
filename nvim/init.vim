" indentation stuff
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" show relative line numbers
set number relativenumber
set numberwidth=2

" make horizontal splits go right and vertical ones go down
set splitbelow
set splitright

" enables mouse in all modes
set mouse=a

set clipboard+=unnamedplus

" highlight search matches
set hlsearch

" set leader key
let mapleader=","

" ,e to remove highlighting from searches
nnoremap <Leader>n :nohl<CR>

" Use Ctrl + HJKL to navigate between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use ,w to save
map <Leader>w :w<CR>

" Automatically removes trailling white space on save
autocmd BufWritePre * %s/\s\+$//e
