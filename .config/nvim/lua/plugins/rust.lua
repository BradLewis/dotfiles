return {
  { "neovim/nvim-lspconfig" },
  {
    "simrat39/rust-tools.nvim",
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--all", "--", "-W", "clippy::all" },
            },
          },
        },
      },
    },
  },
  { "nvim-lua/plenary.nvim" },
  { "mfussenegger/nvim-dap" },
}
