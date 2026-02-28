return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "sf", "<CMD>Oil<CR>", { desc = "Open parent directory " })
    end,
  },
}
