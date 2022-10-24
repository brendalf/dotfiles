return {
    { "wbthomason/packer.nvim" },

    -- coloscheme/visual plugins
    { "rebelot/kanagawa.nvim" },
    { "catppuccin/nvim" },
    {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    },

    -- elixir/mix
    { "brendalf/mix.nvim" },
    { "elixir-editors/vim-elixir", ft = "elixir" },

    -- completion
    { "onsails/lspkind-nvim" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "williamboman/nvim-lsp-installer" },
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

    -- git
    { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "tpope/vim-fugitive" },
    { "kessejones/git-blame-line.nvim" },

    -- github
    { "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
    },

    -- utils
    { "szw/vim-maximizer" },
    { "tpope/vim-surround" },

    -- cursors
    { "mg979/vim-visual-multi" },

    -- terminal
    { "akinsho/toggleterm.nvim", branch = "main" },

    -- finder
    { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "ahmedkhalf/project.nvim" },
    { "windwp/nvim-spectre", branch = "master", requires = { "nvim-lua/plenary.nvim" } },

    -- buffers/windows and tabs
    { "akinsho/bufferline.nvim", branch = "main", requires = "kyazdani42/nvim-web-devicons" },
    { "moll/vim-bbye" },

    -- languages
    { "puremourning/vimspector", ft = "python" },
    { "iamcco/markdown-preview.nvim", ft = "markdown", run = { "cd app && yarn install" } },

    -- initialization
    { "lewis6991/impatient.nvim" },
}
