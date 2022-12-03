" Plugins
call plug#begin()

" nvim's lodash
Plug 'nvim-lua/plenary.nvim'
" lsp + completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
" this doesnt work. maybe try to replace context.vim for this later again.
" Supposed to be faster
" Plug 'nvim-treesitter/nvim-treesitter-context'

" shows code context
Plug 'wellle/context.vim'

" lua gruvbox colorscheme
Plug 'ellisonleao/gruvbox.nvim'

" telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" harpoon
" vim-qf
" vim-fugitive
" notes workflow: ?
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
" db workflow: dadbod, dadbod-ui, dadbod comp

Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'

" netrw improvements
Plug 'tpope/vim-vinegar'

Plug 'google/vim-jsonnet'
Plug 'ojrogues/vim-oscyank'

call plug#end()

" fixes colors
set termguicolors
colorscheme gruvbox
hi Normal ctermbg=none guibg=none

" Always display sign column
set signcolumn=yes

highlight DiagnosticUnderlineError gui=undercurl
highlight DiagnosticUnderlineHint gui=undercurl
highlight DiagnosticUnderlineInfo gui=undercurl
highlight DiagnosticUnderlineWarn gui=undercurl
highlight DiagnosticFloatingError guifg=#fb4934
highlight DiagnosticFloatingWarn guifg=#d79921

" context.vim binds
let g:context_enabled = 0
nnoremap <silent> <leader>ct <cmd>ContextToggleWindow<CR>

lua << END
local function debug()
  return require'dap'.status()
end
require('lualine').setup({
  options = {
    theme = 'gruvbox',
    icons_enabled = false,
  },
  sections = {
    lualine_x = {debug},
    lualine_y = {'hostname'},
  },
})
END
