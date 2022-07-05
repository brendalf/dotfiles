local kanagawa = require("kanagawa")

local M = {}

function M.init()
    kanagawa.setup({
        globalStatus = true
    })
end

return M
