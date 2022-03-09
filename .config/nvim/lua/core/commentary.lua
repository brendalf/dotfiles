local keymappings = require("keymappings")
local M = {}

function M.init()
    local keymap_toggle = "<Leader>c"

    local mappings_common = {
        [keymap_toggle] = ":Commentary<CR>",
    }

    local default_mappings = {
        normal_mode = mappings_common,
        visual_mode = mappings_common,
    }

    keymappings.load(default_mappings)
end

return M
