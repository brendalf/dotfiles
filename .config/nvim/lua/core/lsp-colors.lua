local lsp_colors = require("lsp-colors")

local M = {}

function M.init()
    lsp_colors.setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
    })
end

return M
