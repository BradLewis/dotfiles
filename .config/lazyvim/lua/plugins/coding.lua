require("which-key").register({
  g = {
    b = { "<cmd>lua require'nvim-navbuddy'.open()<cr>", "Open Navbuddy" },
  },
})

return {
  { "ray-x/lsp_signature.nvim" },
  { "onsails/lspkind.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
    },
  },
}
