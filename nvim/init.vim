" set leader key
let mapleader=","

source $HOME/.dotfiles/nvim/plugins.vim

" Enables proper highlighting in json comments
autocmd FileType json syntax match Comment +\/\/.\+$+


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

" Search down into subfolders. Provides tab-completion for all file-related
" tasks
set path+=**

" enables mouse in all modes
set mouse=a

" highlight search matches
set hlsearch

" Ignore case when searching
set ignorecase

" If search contains uppercase characters it becomes case sensitive
set smartcase

" ,n to remove highlighting from searches
nnoremap <Leader>n :nohl<CR>

" fixes typos. Might be interesting
" iab wiht with

" Use Ctrl + HJKL to navigate between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use ,w to save
map <Leader>w :w<CR>

" remaps Y to behave like D
nnoremap Y y$

" Automatically removes trailling white space on save
autocmd BufWritePre * %s/\s\+$//e

