return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "deep",
      diagnostics = {
        darker = false,
        undercurl = true,
        background = true,
      },
    })
    require("onedark").load()
  end,
}
