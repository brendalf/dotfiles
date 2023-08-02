local M = {}

local modules = {
    "autopairs",
    "bufferline",
    "carbon",
    "catppuccin",
    "cmp",
    "commentary",
    "git-blame-line",
    "git-fugitive",
    "gitsigns",
    "lsp",
    "lsp-colors",
    "lsp-installer",
    "lualine",
    "maximizer",
    "mix",
    "multi-cursor",
    "null-ls",
    "octo",
    "project",
    "spectre",
    "telescope",
    "tester"
    "toggleterm",
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
