local keymappings = require("keymappings")
local toggleterm = require("toggleterm")

local M = {}

function M.term_size(term)
    if term.direction == "horizontal" then
        return 15
    elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
    else
        return 20
    end
end

function M.init()
    local keymap_toggle = "<S-Tab>"

    toggleterm.setup({
        -- size can be a number or function which is passed the current terminal
        size = M.term_size,
        open_mapping = keymap_toggle,
        hide_numbers = true, -- hide the number column in toggleterm buffers
        direction = 'vertical',
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
