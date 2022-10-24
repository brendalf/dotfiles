local settings = require("config")

local M = {}

function M.init()
    local scheme_name = "catppuccin"

    if not vim.fn.has("macunix") and vim.fn.has("termguicolors") then
        settings.set("termguicolors", true)
    end

    settings.cmd("colorscheme", scheme_name)
    settings.set("background", "dark")
end

return M
