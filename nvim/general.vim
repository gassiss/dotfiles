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

set wildignorecase

" enables mouse in all modes
set mouse=a

" highlight search matches
set hlsearch

" Ignore case when searching
set ignorecase

" If search contains uppercase characters it becomes case sensitive
set smartcase

