" Plugins
call plug#begin()

Plug 'nvim-lualine/lualine.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" fzf config
nnoremap <silent> <C-p> :FZF<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.50, 'relative': v:true, 'yoffset': 1.0 } }

call plug#end()

" fixes colors
set termguicolors
colorscheme gruvbox
hi Normal ctermbg=none guibg=none

" vim-gitgutter does not expose a way of closing diff preview. This does it
nnoremap <silent> <Leader>hc :bd gitgutter<CR>

" Changing the color of the diff symbols to match gruvbox's
highlight GitGutterAdd guifg=#8ec07c guibg=#3c3836
highlight GitGutterChange guifg=#b8bb26 guibg=#3c3836
highlight GitGutterDelete guifg=#cc241d guibg=#3c3836

lua << END
require('lualine').setup({
  options = {
    theme = 'gruvbox',
    icons_enabled = false,
  }
})
END
