local keymappings = require("keymappings")
local toggleterm = require("toggleterm")

local M = {}

function M.init()
    local keymap_toggle = "<C-i>"

    toggleterm.setup({
        -- size can be a number or function which is passed the current terminal
        size = 20,
        open_mapping = keymap_toggle,
        hide_numbers = true, -- hide the number column in toggleterm buffers
        direction = 'float',
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        float_opts = {
            border = 'curved',
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        }
    })
end

return M
