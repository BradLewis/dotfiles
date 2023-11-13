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
        dynamic_preview_title = true,
      },
    },
    keys = {
      {
        "gR",
        "<cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = { '%.spec.ts' } })<cr>",
        desc = "Go To References (ignoring test files)",
      },
      {
        "<leader>sG",
        "<cmd>lua require('telescope.builtin').live_grep({file_ignore_patterns = { '%.spec.ts' } })<cr>",
        desc = "Grep in files (ignoring test files)",
      },
      {
        "<leader>fF",
        "<cmd>lua require('telescope.builtin').files({file_ignore_patterns = { '%.spec.ts' } })<cr>",
        desc = "Find files (ignoring test files)",
      },
    },
  },
}
