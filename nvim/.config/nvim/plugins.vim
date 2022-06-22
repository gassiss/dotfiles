" Plugins
call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" treesitter
" telescope
" vim-qf
" vim-fugitive
" nvim-dap, dap-ui, dap text
" dadbod, dadbod-ui, dadbod comp

Plug 'nvim-lualine/lualine.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox' " replace with lua one after treesitter

" netrw improvements
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
" Always display gitgutter column
set signcolumn=yes

highlight DiagnosticUnderlineError gui=undercurl
highlight DiagnosticUnderlineHint gui=undercurl
highlight DiagnosticUnderlineInfo gui=undercurl
highlight DiagnosticUnderlineWarn gui=undercurl
highlight DiagnosticFloatingError guifg=#fb4934
highlight DiagnosticFloatingWarn guifg=#d79921

lua << END
require('lualine').setup({
  options = {
    theme = 'gruvbox',
    icons_enabled = false,
  }
})
END
