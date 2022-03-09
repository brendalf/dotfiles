local M = {}

local default_settings = {
    lazyredraw = true,
    smarttab = true,
    backup = false,
    writebackup = false,
    clipboard = "unnamedplus",
    hlsearch = false,
    ignorecase = true,
    showtabline = 1,
    --mouse = "a",
    autoindent = true,
    background = "dark",
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    title = true,
    swapfile = false,
    tabstop = 4,
    hidden = true,
    number = true,
    relativenumber = true,
    wrap = true,
    cursorline = true,
    inccommand = "split",
    scrolloff = 10,
    sidescrolloff = 5,
    guifont = "monospace:h17",
    wildmenu = true,
    incsearch = true,
    conceallevel = 0,
    timeoutlen = 300,
    completeopt = { "menu", "menuone", "noselect" },
    shell = "fish",
    laststatus = 2,
    cc = { "120" },
    cmdheight = 1,
    encoding = "utf-8",
    autoread = true,
}

function M.set(key, value)
    vim.opt[key] = value
end

function M.cmd(command, argument)
    vim.cmd(command .. " " .. argument)
end

function M.init()
    vim.opt.shortmess:append("c")
    vim.opt.path:append("**")

    vim.opt.wildignore:append("**/node_modules/*")
    vim.opt.wildignore:append("**/vendor/*")
    vim.opt.wildignore:append("**/.git/*")
    vim.opt.wildignore:append("**/coverage/*")
    vim.opt.wildignore:append("**/code_coverage_html/*")

    M.cmd("au", "FocusGained, BufEnter * :checktime")

    vim.g.python3_host_prog = vim.fn.expand("/usr/bin/python3")
    vim.g.python_host_prog = vim.fn.expand("/usr/bin/python")

    for key, value in pairs(default_settings) do
        M.set(key, value)
    end
end

return M
