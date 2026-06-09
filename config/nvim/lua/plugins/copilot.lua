return {
  -- amongst your other plugins
  -- { 'akinsho/toggleterm.nvim', version = "*", config = true }
  -- or
  {
    "github/copilot.vim",
    config = function()
      -- Disable Copilot by default
      vim.g.copilot_enabled = false
    end,
  },
}
