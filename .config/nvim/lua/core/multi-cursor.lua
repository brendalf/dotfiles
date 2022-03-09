local M = {}

function M.init()
    local leader = "\\"
    vim.g.VM_leader = leader
    vim.g.VM_maps = {
        ["Add Cursor At Pos"] = leader .. "\\",
        ["Add Cursor Up"] = leader .. "k",
        ["Add Cursor Down"] = leader .. "j",
    }
end

return M
