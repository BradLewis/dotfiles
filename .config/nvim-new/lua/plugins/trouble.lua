return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "n", "<leader>xx", "<cmd>TroubleToggle<cr>", { noremap = true, silent = true } },
    { "n", "<leader>xX", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", { noremap = true, silent = true } },
    { "n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", { noremap = true, silent = true } },
    { "n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { noremap = true, silent = true } },
    { "n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { noremap = true, silent = true } },
    { "n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { noremap = true, silent = true } },
  },
}
