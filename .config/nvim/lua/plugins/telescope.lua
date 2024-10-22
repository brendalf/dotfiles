return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      { "<leader><Space>", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    }
  end,
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

    local find_all_files = function()
      require("telescope.builtin").find_files({
        no_ignore = true,
        hidden = true,
      })
    end

    local resume = function()
      require("telescope.builtin").resume()
    end

    local live_grep = function()
      require("telescope.builtin").live_grep()
    end

    local diagnostics = function()
      require("telescope.builtin").diagnostics()
    end

    local buffers = function()
      require("telescope.builtin").buffers()
    end

    local treesitter = function()
      require("telescope.builtin").treesitter()
    end

    vim.keymap.set("n", "<Leader>fp", "<cmd>Telescope projects<CR>", { desc = "Seach for projects" })
    vim.keymap.set("n", ";g", "<cmd>Telescope git_commits<CR>", { desc = "Seach for projects" })

    vim.keymap.set("n", ";;", resume, { desc = "Resume the previous telescope" })
    vim.keymap.set("n", ";f", find_all_files, { desc = "Find all files" })
    vim.keymap.set("n", ";r", live_grep, { desc = "Search for string in current directory" })
    vim.keymap.set("n", ";e", diagnostics, { desc = "List diagnostics" })
    vim.keymap.set("n", ";b", buffers, { desc = "List buffers" })
    vim.keymap.set("n", ";s", treesitter, { desc = "List function names and variables from treesitter" })
  end,
}
