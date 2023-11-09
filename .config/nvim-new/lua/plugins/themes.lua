return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "deep",
  },
  config = function()
    require("onedark").setup({
      style = "deep",
    })
    require("onedark").load()
  end,
}
