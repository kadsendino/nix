return {
  -- add gruvbox
  { "pauchiner/pastelnight.nvim", name = "pastelnight", priority = 1000 },
  { "EdenEast/nightfox.nvim", name = "nightfox", priority = 1001 },
  { "folke/tokyonight.nvim", name = "tokyonight", priority = 1002 },
  { "vim-scripts/mod_tcsoft.vim", name = "tsoft", priority = 1003 },
  { "scottmckendry/cyberdream.nvim", name = "cyberdream", priority = 1003 },
  { "yosiat/oceanic-next-vim", name = "OceanicNext", priority = 1003 },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "duskfox",
    },
  },
}
