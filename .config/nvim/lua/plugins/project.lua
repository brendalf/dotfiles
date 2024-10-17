return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        active = true,
        patterns = {
          ".git",
          "Makefile",
          "package.json",
          "Cargo.toml",
          "composer.json",
          "pyproject.toml",
          "stylua.toml",
        },
        ignore_lsp = {},
        datapath = vim.fn.stdpath("data"),
      })
    end,
    keys = {
      { "<Leader>fp", "<cmd>Telescope projects<CR>", desc = "Seach for projects" },
    },
  },
}
