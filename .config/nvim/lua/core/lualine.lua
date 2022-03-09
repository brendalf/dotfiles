local lualine = require("lualine")

local M = {}

function M.init()
    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { { "filename", file_status = false, path = 0 } },
            lualine_x = { { "diagnostics", source = { "nvim_lsp" } }, "encoding", "filetype" },
            --[[lualine_x = {]]
              --[[{ "diagnostics", sources = {"nvim_lsp"}, symbols = {error = " ", warn = " ", info = " ", hint = " "} },]]
              --[["encoding",]]
              --[["filetype"]]
            --[[},]]
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { "filename", file_status = true, path = 1 } },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {
            --[[lualine_a = {{]]
                --[['tabs',]]
                --[[max_length = vim.o.columns / 2,]]
                --[[mode = 1,]]
                --[[tabs_color = {]]
                    --[[active = 'lualine_a_normal',]]
                    --[[inactive = 'lualine_a_inactive',]]
                --[[},]]
            --[[}},]]
        },
        extensions = {
            "nvim-tree",
            "fugitive",
            "toggleterm",
        },
    })
end

return M
