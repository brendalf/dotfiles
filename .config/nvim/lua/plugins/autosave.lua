return {
  "okuuva/auto-save.nvim",
  opts = {
    enabled = function()
      -- Disable autosave for Java files
      local ft = vim.bo.filetype
      return ft ~= "java"
    end,
    -- Other config options you may have
  },
}
