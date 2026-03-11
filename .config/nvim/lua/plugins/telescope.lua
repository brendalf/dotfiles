return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><Space>", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    { "<Leader>fp", "<cmd>Telescope projects<CR>", desc = "Search for projects" },
    { ";g", "<cmd>Telescope git_commits<CR>", desc = "Search git commits" },
    { ";;", function() require("telescope.builtin").resume() end, desc = "Resume the previous telescope" },
    { ";f", function() require("telescope.builtin").find_files({ no_ignore = true, hidden = true }) end, desc = "Find all files" },
    { ";r", function() require("telescope.builtin").live_grep() end, desc = "Search for string in current directory" },
    { ";e", function() require("telescope.builtin").diagnostics() end, desc = "List diagnostics" },
    { ";b", function() require("telescope.builtin").buffers() end, desc = "List buffers" },
    { ";s", function() require("telescope.builtin").treesitter() end, desc = "List function names and variables from treesitter" },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_results = true,
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        n = {},
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
    }

    telescope.setup(opts)

    require("telescope").load_extension("git_worktree")
    require("telescope").load_extension("projects")
  end,
}
