local M = {}

local modules = {
    "autopairs",
    "bufferline",
    "carbon",
    "catppuccin",
    "cmp",
    "commentary",
    "git-nvim",
    "gitsigns",
    "lsp",
    "nvim-colorizer",
    "lsp-installer",
    "lualine",
    "maximizer",
    "mix",
    "multi-cursor",
    "octo",
    "project",
    "spectre",
    "telescope",
    "tester",
    "treesitter",
    "vimspector",
    "worktree",
}

function M.init()
    local module_base = "core."
    for _, path_module in ipairs(modules) do
        local module = require(module_base .. path_module)
        module.init()
    end
end

return M
