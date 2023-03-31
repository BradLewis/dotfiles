return {
  { "rmagatti/auto-session" },
  { "okuuva/auto-save.nvim" },
  { "numToStr/Comment.nvim" },
  { "kylechui/nvim-surround" },
  { "folke/neodev.nvim" },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end,
  },
}
