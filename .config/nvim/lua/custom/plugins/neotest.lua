local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python"),
        require("neotest-plenary"),
        require("neotest-rust"),
        require("neotest-jest"),
      },
    })
  end,
  keys = {
    { "<leader>tr", "<cmd>lua require'neotest'.run.run()<cr>", desc = "Run nearest test" },
    { "<leader>tf", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>", desc = "Run tests in current file" },
    { "<leader>td", "<cmd>lua require'neotest'.run.run({strategy = 'dap'})<cr>", desc = "Debug nearest test" },
    { "<leader>te", "<cmd>lua require'neotest'.run.stop()<cr>", desc = "Stop nearest test" },
    { "<leader>ts", "<cmd>lua require'neotest'.summary.open()<cr>", desc = "Open summary window" },
    { "<leader>to", "<cmd>lua require'neotest'.output.open({ enter = true })<cr>", desc = "Open output window" },
    { "<leader>tp", "<cmd>lua require'neotest'.output_panel.open()<cr>", desc = "Open output panel" },
  },
}

return M
