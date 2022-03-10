local keymappings = require("keymappings")
local gitblameline = require("git-blame-line")

local M = {}

function M.init()
    gitblameline.setup()

    local mappings = {
        normal_mode = {
            ["<Leader>gt"] = "<cmd>:GitBlameLineToggle<CR>",
        },
    }

    keymappings.load(mappings)
end

return M
