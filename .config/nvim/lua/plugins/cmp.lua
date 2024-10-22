return {
  "nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "rcarriga/cmp-dap",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "alexander-born/cmp-bazel",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "c", "s" }),
      ["<C-j>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          cmp.complete()
        end
      end, { "i", "c", "s" }),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
    })
  end,
}
