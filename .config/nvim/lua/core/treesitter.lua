local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
local treesitter = require("nvim-treesitter.configs")
local M = {}

function M.init()
    parser_config.hcl = {
      install_info = {
        url = vim.fn.stdpath('data') .. "/site/pack/packer/start/tree-sitter-hcl",
        files = {"src/parser.c", "src/scanner.cc"},
      },
      used_by = {"terraform"}
    }

    treesitter.setup({
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        rainbow = {
            enable = true,
        },
        ensure_installed = {
            "tsx",
            "toml",
            "fish",
            "json",
            "yaml",
            "html",
            "hcl",
            "scss",
            "python",
            "javascript",
            "elixir",
            "php",
            "go",
            "typescript",
            "graphql"
        }
    })
end

return M
