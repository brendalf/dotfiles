local keymappings = require("keymappings")

local M = {}

function M.init()
    keymappings.load({
        normal_mode = {
            ["<Leader>gs"] = ":G<CR>",
            ["<Leader>gb"] = ":G blame<CR>",
            ["<Leader>gap"] = ":G add -p<CR>",
            ["<Leader>gc"] = ":G commit<CR>",
            ["<Leader>gp"] = ":G push<CR>",
            ["<Leader>gd"] = ":G pull<CR>",
            ["<Leader>gdm"] = ":G pull origin master<CR>",
            ["<Leader>gl"] = ":G log --oneline<CR>",
        },
    })
end

return M
