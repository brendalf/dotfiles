return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    require("git-worktree").setup()
  end,
  keys = {
    {
      "<Leader>gw",
      function()
        require("telescope").extensions.git_worktree.git_worktrees()
      end,
      desc = "Seach for projects",
    },
    {
      ";w",
      function()
        require("telescope").extensions.git_worktree.create_git_worktree()
      end,
      desc = "Seach for projects",
    },
  },
}
