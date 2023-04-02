return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "flake8",
      "black",
      "prettierd",
      "rust-analyzer",
    },
  },
}
