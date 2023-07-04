return {
    { "wbthomason/packer.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    -- Copilot
    { "github/copilot.vim" },

    -- coloscheme/visual plugins
    { "catppuccin/nvim", as = "catppuccin" },
    { "nvim-lualine/lualine.nvim" },

    -- finder
    { "nvim-telescope/telescope.nvim" },

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

    -- folder navigation
    { "SidOfc/carbon.nvim" },

    -- formatting/syntax
    { "windwp/nvim-autopairs" },
    {
        "nvim-treesitter/nvim-treesitter",
        requires = {
           "mitchellh/tree-sitter-hcl",
        },
        run = { ":TSUpdate" },
        config = [[require('config.treesitter')]],
    },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "tpope/vim-commentary" },

    -- git
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-fugitive" },
    { "kessejones/git-blame-line.nvim" },

    -- github
    { "pwntester/octo.nvim" },

    -- test
    { "kessejones/tester.nvim" },

    -- utils
    { "szw/vim-maximizer" },
    { "tpope/vim-surround" },

    -- cursors
    { "mg979/vim-visual-multi" },

    -- terminal
    { "akinsho/toggleterm.nvim", branch = "main" },


    { "ahmedkhalf/project.nvim" },
    { "windwp/nvim-spectre", branch = "master" },

    -- buffers/windows and tabs
    { "akinsho/bufferline.nvim", branch = "main" },
    { "moll/vim-bbye" },

    -- languages
    { "puremourning/vimspector", ft = "python" },
    { "iamcco/markdown-preview.nvim", ft = "markdown", run = { "cd app && yarn install" } },

    -- initialization
    { "lewis6991/impatient.nvim" },
}
