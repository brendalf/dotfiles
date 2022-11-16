local treesitter = require("nvim-treesitter.configs")
local M = {}

function M.init()
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
