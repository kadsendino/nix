return {
  'rebelot/terminal.nvim',
  config = function()
    require("terminal").setup({
      layout = { open_cmd = "botright new" }
    })
  end
}
