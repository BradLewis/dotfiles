local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python"),
        require("neotest-plenary"),
        require("neotest-rust")({
          dap_adapter = "lldb",
        }),
      },
    })
  end,
}

require("which-key").register({
  ["<leader>"] = {
    t = {
      name = "Test",
      r = { "<cmd>lua require'neotest'.run.run()<cr>", "Run nearest test" },
      f = {
        "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>",
        "Run tests in current file",
      },
      d = { "<cmd>lua require'neotest'.run.run({strategy = 'dap'})<cr>", "Debug nearest test" },
      e = { "<cmd>lua require'neotest'.run.stop()<cr>", "Stop nearest test" },
      s = {
        name = "Summary",
        o = { "<cmd>lua require'neotest'.summary.open()<cr>", "Open summary window" },
        c = { "<cmd>lua require'neotest'.summary.close()<cr>", "Close summary window" },
        t = { "<cmd>lua require'neotest'.summary.toggle()<cr>", "Toggle summary window" },
      },
      o = { "<cmd>lua require'neotest'.output.open({ enter = true })<cr>", "Open output window" },
      p = {
        name = "Output panel",
        o = { "<cmd>lua require'neotest'.output_panel.open()<cr>", "Open output panel" },
        c = { "<cmd>lua require'neotest'.output_panel.close()<cr>", "Close output panel" },
        t = { "<cmd>lua require'neotest'.output_panel.toggle()<cr>", "Toggle output panel" },
      },
    },
  },
})

return M
