return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          ".git/",
          "node_modules",
          "vendor",
        },
      },
    },
    keys = {
      {
        "gR",
        "<cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = { '%.spec.ts' } })<cr>",
        desc = "Go To References (ignoring test files)",
      },
    },
  },
}
