local M = {}

local function run_command(cmd)
  return vim.fn.system(table.concat(cmd, " "))
end

function M.fix_remote_origin()
  local output = vim.fn.trim(run_command({
    "git",
    "config",
    "--get",
    "remote.origin.fetch",
  }))

  if output == nil or output == "" then
    vim.notify("Fixing git remote.origin.fetch")
    vim.fn.trim(run_command({
      "git",
      "config",
      "remote.origin.fetch",
      "'+refs/heads/*:refs/remotes/origin/*'",
    }))
  end
end

return M
