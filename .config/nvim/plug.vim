let g:plug_home = stdpath('data') . '/plugged'

call plug#begin()

" git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

" powerline
Plug 'hoob3rt/lualine.nvim'

" inside folder
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" lsp
Plug 'neovim/nvim-lspconfig'

" auto complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" nice icons
Plug 'kyazdani42/nvim-web-devicons'

" IDK
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-colors.nvim'

" snippets
Plug 'L3MON4D3/LuaSnip'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" autopairs
Plug 'windwp/nvim-autopairs'

" themes
Plug 'morhetz/gruvbox'

" comment lines or blocks of code
Plug 'preservim/nerdcommenter'

" multiple cursor selection
Plug 'terryma/vim-multiple-cursors'

" maximizer
Plug 'szw/vim-maximizer'

" surround
Plug 'tpope/vim-surround'

"------------------------------------------------------------------------------
" Lazy Plugins
"------------------------------------------------------------------------------
Plug 'puremourning/vimspector', {'for': ['python']}
Plug 'gabrielelana/vim-markdown', {'for': ['markdown']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['markdown']  }
Plug 'sotte/presenting.vim', {'for': ['markdown']}
Plug 'elixir-editors/vim-elixir', {'for': ['elixir']}
Plug 'ray-x/go.nvim', {'for': ['go']}

call plug#end()
