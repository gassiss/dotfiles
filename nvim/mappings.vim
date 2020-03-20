" normal mode I want ; to be :
nnoremap ; :
nnoremap : ;

" replace ` with ' in normal mode for better mark jumping
nnoremap ` '
nnoremap ' `

" jk exists insert mode
inoremap jk <right><Esc>

" Use ,w to save
nnoremap <Leader>w :w<CR>

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

" ESC on terminal mode behaves like insert mode
tnoremap <ESC> <C-\><C-n>

" Increase/reduce vertical split size.
nnoremap <silent> <a-,> :vertical resize -1<CR>
nnoremap <silent> <a-.> :vertical resize +1<CR>
nnoremap <silent> <a-<> :vertical resize -5<CR>
nnoremap <silent> <a->> :vertical resize +5<CR>

" Increase/reduce horizontal split size.
nnoremap <silent> <a--> :resize -1<CR>
nnoremap <silent> <a-=> :resize +1<CR>
nnoremap <silent> <a-_> :resize -5<CR>
nnoremap <silent> <a-+> :resize +5<CR>

" ,gb on visual mode pastes the selected text inside a replacer
" This is supposed to be used in similar scenarios as GB/Ctrl-D in VSCode
vnoremap <Leader>gb y:%s/<C-R>"//gc<left><left><left>

function! Tag()
  let tagName = input('Tag name: ')
  return "<".tagName."></".tagName.">\eF/hi"
endfunction
inoremap <expr> <Leader>ta Tag()

function! CloseTag()
  let tagName = input('Tag name: ')
  return "<".tagName." />"
endfunction
inoremap <expr> <Leader>ct CloseTag()

" Copy to system clipboard
vnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>yy "+yy

" Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
