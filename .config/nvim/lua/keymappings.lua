local M = {}

local generic_opts = {
    noremap = true,
    silent = true,
}

local mode_adapter = {
    normal_mode = "n",
    visual_mode = "v",
    visual_block_mode = "x",
    insert_mode = "i",
    command_mode = "c",
    terminal_mode = "t",
}

local default_mappings = {
    insert_mode = {
        -- ESC helper
        ["<C-c>"] = "<ESC>",
        ["jk"] = "<ESC>",

        -- move line up/down
        ["<C-j>"] = "<ESC>:m .+2<CR>==gi",
        ["<C-k>"] = "<ESC>:m .-1<CR>==gi",
    },
    normal_mode = {
        ["<Space>"] = "<NOP>",

        -- Tabs
        -- ["te"] = ":tabedit<CR>",
        -- ["<S-h>"] = ":tabprev<CR>",
        -- ["<S-l>"] = ":tabnext<CR>",

        -- Save / Close file
        ["<C-s>"] = ":w<CR>",
        ["<C-q>"] = ":q<CR>",
        ["<Leader>sq"] = ":wq<CR>",

        -- Navigate in windows
        ["sh"] = "<C-w>h",
        ["sj"] = "<C-w>j",
        ["sk"] = "<C-w>k",
        ["sl"] = "<C-w>l",

        -- Cycle windows
        ["<Leader>ww"] = "<C-w>r",

        -- Duplicate current line
        ["<Leader>y"] = "<ESC>yyp",

        -- Next/Previous buffer
        ["<S-l>"] = ":bn<CR>",
        ["<S-h>"] = ":bp<CR>",

        -- Close buffer
        ["<Leader>."] = ":bdelete<CR>",

        -- Replace
        ["<C-h>"] = "<ESC>:%s/",

        -- Reload file
        ["<C-r>"] = ":e!<CR>",

        -- Split window
        ["<Leader>sv"] = ":vsplit<CR>",
        ["<Leader>sh"] = ":sv<CR>",

        -- Delete
        ["<Leader>d"] = '"_d',
        ["x"] = '"_x',

        -- Select all
        ["<C-a>"] = "gg<S-v>G",
    },
    visual_mode = {
        -- Indent
        ["<"] = "<gv",
        [">"] = ">gv",

        -- Move up/down selected text
        ["<C-j>"] = ":m '>+2<CR>gv=gv",
        ["<C-k>"] = ":m '<-1<CR>gv=gv",
    },
    visual_block_mode = {
    },
    command_mode = {
    },
}

function M.set_keymaps(mode, key, val, bufnr)
    if not bufnr then
        vim.api.nvim_set_keymap(mode, key, val, generic_opts)
    else
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, val, generic_opts)
    end
end

function M.load_mode(mode, mapping, bufnr)
    mode = mode_adapter[mode] and mode_adapter[mode] or mode
    for key, value in pairs(mapping) do
        M.set_keymaps(mode, key, value, bufnr)
    end
end

function M.load(mappings, bufnr)
    for mode, mapping in pairs(mappings) do
        M.load_mode(mode, mapping, bufnr)
    end
end

function M.init()
    vim.g.mapleader = " "
    M.load(default_mappings)
end

return M
