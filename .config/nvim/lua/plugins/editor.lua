return {
  { "rmagatti/auto-session" },
  { "okuuva/auto-save.nvim" },
  { "numToStr/Comment.nvim" },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  { "folke/neodev.nvim" },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end,
  },
}
