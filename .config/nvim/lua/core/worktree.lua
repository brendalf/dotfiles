local worktree = require("git-worktree")

local M = {}

function M.init()
    worktree.setup({})
end

return M
