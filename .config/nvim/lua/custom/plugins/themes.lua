return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "deep",
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    })
    require("onedark").load()
  end,
}
