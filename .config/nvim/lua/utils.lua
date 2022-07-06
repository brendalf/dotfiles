local M = {}

function M.contains(list, value)
    for _, t in pairs(list) do
        if t == value then
            return true
        end
    end
    return false
end

return M
