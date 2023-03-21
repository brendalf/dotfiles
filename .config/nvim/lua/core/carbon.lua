local keymappings = require("keymappings")
local carbon = require("carbon")

local M = {}

function M.init()
    -- carbon.setup()

    local mappings = {
        normal_mode = {
            ["sf"] = "<cmd>:Lcarbon<CR>"
        }
    }

    keymappings.load(mappings)
end

return M
