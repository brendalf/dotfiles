local keymapping = require("keymappings")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local utils = require("utils")

local M = {}

local servers = {
    tsserver = {},
    rust_analyzer = {},
    dockerls = {},
    yamlls = {},
    html = {},
    cssls = {},
    intelephense = {},
    clangd = {},
    gopls = {},
    pyright = {},
    jdtls = {}
}

local disabled_formatting_on_save = { "tsserver", "json", "html", "lua_ls" }

function M.enable_format_on_save(client, bufnr)
    bufnr = bufnr or 0

    if client.server_capabilities.document_formatting then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            group = "LspFormatting",
            callback = function()
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
end

function M.disable_format_on_save(client)
    client.server_capabilities.document_formatting = false
end

function M.enable_highlight(client, bufnr)
    bufnr = bufnr or 0

    if client.server_capabilities.document_highlight then
        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            group = "LspDocumentHighlight",
            callback = function()
                vim.lsp.buf.document_highlight()
            end,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            group = "LspDocumentHighlight",
            callback = function()
                vim.lsp.buf.clear_references()
            end,
        })
    end
end

function M.lsp_config()
    vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })

    local mapping = {
        normal_mode = {
            ["K"] = function()
                vim.lsp.buf.hover()
            end,
            ["gd"] = function()
                vim.lsp.buf.definition()
            end,
            ["ga"] = function()
                vim.lsp.buf.code_action()
            end,
            ["gr"] = function()
                vim.lsp.buf.references()
            end,
            ["gi"] = function()
                vim.lsp.buf.implementation()
            end,
            ["<Leader>rn"] = function()
                vim.lsp.buf.rename()
            end,
            ["[g"] = function()
                vim.diagnostic.goto_prev()
            end,
            ["]g"] = function()
                vim.diagnostic.goto_next()
            end,
            ["<S-u>"] = function()
                vim.diagnostic.open_float()
            end,
            ["<Leader>ff"] = function()
                vim.lsp.buf.formatting()
            end,
        },
        visual_mode = {
            ["<Leader>ff"] = function()
                vim.lsp.buf.range_formatting()
            end,
        },
    }

    local on_attach = function(client, bufnr)
        if client.name == "copilot" then
            return
        end

        keymapping.load(mapping, bufnr)

        if utils.contains(disabled_formatting_on_save, client.name) then
            M.disable_format_on_save(client)
        else
            M.enable_format_on_save(client, bufnr)
        end

        M.enable_highlight(client, bufnr)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    for server, config in pairs(servers) do
        config["on_attach"] = on_attach
        config["capabilities"] = capabilities

        lspconfig[server].setup(config)
    end
end

function M.handlers()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

function M.diagnostics()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)
end

function M.init()
    M.lsp_config()
    M.handlers()
    M.diagnostics()
end

return M
