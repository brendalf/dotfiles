return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { ";t", "<cmd>TodoTelescope<CR>", desc = "Seach for todo comments" },
    },
  },
}
