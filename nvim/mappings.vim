" replace ` with ' in normal mode for better mark jumping
nnoremap ` '
nnoremap ' `

" jumping keeps buffer centered
nnoremap n nzzzv
nnoremap N Nzzzv

" move selected text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" replace highlighted text
vnoremap <leader>s "hy:%s/<C-r>h//c<left><left><left>
vnoremap <leader>c "hy:%s/<C-r>h//gc<left><left>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

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
nnoremap <leader><leader>p "+p
nnoremap <leader><leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
