return {
    { "wbthomason/packer.nvim" },
    { "nvim-lua/plenary.nvim" },

    -- icons
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
    {
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    },
    { "saadparwaiz1/cmp_luasnip" },
    { "williamboman/nvim-lsp-installer" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },

    -- colors
    { "norcalli/nvim-colorizer.lua" },

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
    { "tpope/vim-commentary" },

    -- git
    { "lewis6991/gitsigns.nvim" },
    { "dinhhuy258/git.nvim" },
    { "ThePrimeagen/git-worktree.nvim" },

    -- github
    { "pwntester/octo.nvim" },

    -- test
    { "kessejones/tester.nvim" },

    -- utils
    { "szw/vim-maximizer" },
    { "tpope/vim-surround" },

    -- cursors
    { "mg979/vim-visual-multi" },

    -- general
    { "ahmedkhalf/project.nvim" },
    { "windwp/nvim-spectre", branch = "master" },

    -- buffers/windows and tabs
    { "akinsho/bufferline.nvim", branch = "main" },
    { "moll/vim-bbye" },

    -- languages
    { "puremourning/vimspector" },
    { "iamcco/markdown-preview.nvim", run = { "cd app && yarn install" } },

    -- initialization
    { "lewis6991/impatient.nvim" },
}
