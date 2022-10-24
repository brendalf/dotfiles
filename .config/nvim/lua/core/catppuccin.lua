local catppuccin = require("catppuccin")

local M = {}

function M.init()
    catppuccin.setup({
        globalStatus = true,
        flavour = "mocha"
    })
end

return M
