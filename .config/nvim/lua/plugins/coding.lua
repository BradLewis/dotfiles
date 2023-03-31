return {
  { "ray-x/lsp_signature.nvim" },
  { "onsails/lspkind.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  {
    "sbdchd/neoformat",
  },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({})
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
