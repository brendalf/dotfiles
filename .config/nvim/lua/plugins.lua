return {
    { "wbthomason/packer.nvim" },

    -- coloscheme/visual plugins
    { "morhetz/gruvbox" },
    {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    },
    { "lukas-reineke/indent-blankline.nvim" },

    -- elixir/mix
    { "brendalf/mix-fugitive" },
    { "elixir-editors/vim-elixir", ft = "elixir" },

    -- completion
    { "onsails/lspkind-nvim" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "folke/lsp-colors.nvim" },

    -- inside folder
    { "kristijanhusak/defx-git" },
    { "kristijanhusak/defx-icons" },
    { "Shougo/defx.nvim", run = { ":UpdateRemotePlugins" } },

    -- formatting/syntax
    { "jiangmiao/auto-pairs" },
    { "nvim-treesitter/nvim-treesitter", run = { ":TSUpdate" } },
    { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "tpope/vim-commentary" },
    -- { "preservim/nerdcommenter" },

    -- git
    { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "tpope/vim-fugitive" },
    -- { "tpope/vim-rhubarb" },
    { "kessejones/git-blame-line.nvim" },

    -- utils
    { "szw/vim-maximizer" },
    { "tpope/vim-surround" },

    -- cursors
    { "mg979/vim-visual-multi" },
    -- { "terryma/vim-multiple-cursors" },

    -- terminal
    { "akinsho/toggleterm.nvim" },

    -- finder
    { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "ahmedkhalf/project.nvim" },

    -- buffers/windows and tabs
    { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" },
    { "moll/vim-bbye" },

    -- languages
    { "puremourning/vimspector", ft = "python" },
    --{ "gabrielelana/vim-markdown", ft = "markdown" },
    { "iamcco/markdown-preview.nvim", ft = "markdown", run = { "cd app && yarn install" } },
    --{ "sotte/presenting.vim", ft = "markdown" },
    --{ "ray-x/go.nvim", ft = "go" }
}
