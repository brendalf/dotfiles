local M = {}

local modules = {
    "bufferline",
    "cmp",
    "commentary",
    "defx",
    "git-blame-line",
    "git-fugitive",
    "gitsigns",
    "octo",
    "kanagawa",
    "lsp-installer",
    "lsp",
    "lsp-colors",
    "lualine",
    "maximizer",
    "mix",
    "autopairs",
    "multi-cursor",
    "null-ls",
    "project",
    "spectre",
    "telescope",
    "toggleterm",
    "treesitter",
    "vimspector"
}

function M.init()
    local module_base = "core."
    for _, path_module in ipairs(modules) do
        local module = require(module_base .. path_module)
        module.init()
    end
end

return M
