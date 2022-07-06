
local lsp_installer = require("nvim-lsp-installer")

local M = {}

function M.init()
    lsp_installer.setup({
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        ui = {
            icons = {
                server_installed = "?",
                server_pending = "?",
                server_uninstalled = "?"
            }
        }
    })
end

return M
