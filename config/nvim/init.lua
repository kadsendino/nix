-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Auto-Update beim Start von Neovim
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("lazy").update({ show = false }) -- `show = false` unterdrückt UI
  end,
})

-- Use system clipboard
vim.o.clipboard = "unnamedplus"
