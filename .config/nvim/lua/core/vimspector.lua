local keymappings = require("keymappings")

local M = {}

function M.init()
    keymappings.load({
        normal_mode = {
            ["<Leader>dd"] = ":call vimspector#Launch()<Return>",
            ["<Leader>de"] = ":call vimspector#Reset()<Return>",
            ["<Leader>dl"] = "<Plug>VimspectorStepInto",
            ["<Leader>dj"] = "<Plug>VimspectorStepOver",
            ["<Leader>dk"] = "<Plug>VimspectorStepOut",
            ["<Leader>dr"] = "<Plug>VimspectorRestart",
            ["<Leader>d<space>"] = ":call vimspector#Continue()<Return>",
            ["<Leader>drc"] = "<Plug>VimspectorRunToCursor",
            ["<Leader>dbp"] = "<Plug>VimspectorToggleBreakpoint",
            ["<Leader>dcbp"] = "<Plug>VimspectorToggleConditionalBreakpoint",
        },
    })
end

return M
