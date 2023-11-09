return {
  "okuuva/auto-save.nvim",
  event = "VeryLazy",
  config = function()
    require("auto-save").setup()
  end,
}
