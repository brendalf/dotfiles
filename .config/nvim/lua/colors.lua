local settings = require("config")

local M = {}

function M.init()
    local scheme_name = "gruvbox"

    if not vim.fn.has("macunix") and vim.fn.has("termguicolors") then
        settings.set("termguicolors", true)
    end

    settings.cmd("colorscheme", scheme_name)
    vim.g.gruvbox_contrast_dark = "hard"
end

--function M.scheme_exists(scheme)
    --local schemes = vim.fn.getcompletion("", "color")
    --for _, t in ipairs(schemes) do
        --if t == scheme then
            --return true
        --end
    --end
    --return false
--end

return M
