local blankline = require("indent_blankline")
local M = {}

function M.init()
    blankline.setup({
        show_current_context = true,
        show_current_context_start = true,
        bufname_exclude = { "terminal", "startfy", "NvimTree", "ToggleTerm" },
        buftype_exclude = { "help", "startfy", "dashboard", "packer" },
    })
end

return M
