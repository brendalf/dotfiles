local mix = require("mix")

local M = {}

function M.init()
    mix.setup({
        window = "floating"
    })
end

return M
