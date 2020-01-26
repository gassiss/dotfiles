" normal mode I want ; to be :
nnoremap ; :

" Use ,w to save
map <Leader>w :w<CR>

" remaps Y to behave like D
nnoremap Y y$

" ,n to remove highlighting from searches
nnoremap <Leader>n :nohl<CR>

" Use Ctrl + HJKL to navigate between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" ,gb on visual mode pastes the selected text inside a replacer
" This is supposed to be used in similar scenarios as GB/Ctrl-D in VSCode
vnoremap <Leader>gb y:%s/<C-R>"//gc<left><left><left>

