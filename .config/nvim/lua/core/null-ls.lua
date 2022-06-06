local lsp = require("core.lsp")
local null_ls = require("null-ls")

local M = {}

function M.init()
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
        on_attach = function(client, bufnr)
            lsp.enable_format_on_save(client, bufnr)
        end,
        sources = {
            formatting.prettier,
            formatting.stylua.with({
                condition = function(utils)
                    return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                end,
            }),
        },
    })
end

return M
