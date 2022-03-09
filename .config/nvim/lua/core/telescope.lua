local telescope = require("telescope")
local actions = require("telescope.actions")
local keymappings = require("keymappings")

local M = {}

function M.init()
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<CR>"] = actions.select_default,
                    ["<C-c>"] = actions.close,
                },
                n = {
                    ["<ESC>"] = actions.close,
                },
            },
        },
    })

    keymappings.load({
        normal_mode = {
            ["<C-p>"] = ":lua require('core.telescope').find_files()<CR>",
            ["<Leader>p"] = ":Telescope find_files<CR>",
            [";r"] = ":Telescope live_grep<CR>",
            [";b"] = ":Telescope buffers<CR>",
            [";l"] = ":Telescope lsp_references<CR>",
            [";s"] = ":Telescope git_stash<CR>",
            [";g"] = ":Telescope git_commits<CR>",
            [";;"] = ":Telescope help_tags<CR>",
            [";/"] = ":lua require('core.telescope').curr_buf()<CR>",
        },
    })
end

function M.curr_buf()
    local opts = require('telescope.themes').get_dropdown({
        height = 10,
        previewer = false
    })
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.find_files()
    local opts = require('telescope.themes').get_dropdown({
        height = 10,
        previewer = false,
    })
    require('telescope.builtin').find_files(opts)
end

return M
