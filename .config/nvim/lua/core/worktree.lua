local worktree = require("git-worktree")
local telescope = require("telescope")
local keymappings = require("keymappings")

local M = {}

function M.init()
    worktree.setup()
    telescope.load_extension("git_worktree")

    keymappings.load({
        normal_mode = {
            [";w"] = ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
            ["gwa"] = ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",

        }
    })
end

return M
