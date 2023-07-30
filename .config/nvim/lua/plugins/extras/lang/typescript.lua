return {
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "LspAttach",
    opts = {
      enable_tailwind = true,
      enable_named_colors = true,
    },
  },
}
