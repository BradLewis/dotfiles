return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",

    dependencies = {
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "nvim-neotest/nvim-nio",
      "folke/which-key.nvim",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      require("dapui").setup()
      require("dap-go").setup()
      require("dap-python").setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dap.adapters.lldb = {
        type = "executable",
        command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
        name = "lldb",
      }

      -- configure the adapter for Rust Debugging
      dap.configurations.rust = {
        {
          name = "Launch Debug",
          type = "rt_lldb",
          request = "launch",
          program = function()
            local default_file = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/" .. default_file, "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          initCommand = {},
          runInTerminal = true,
        },
      }
      require("which-key").add({
        { "<F10>",      "<cmd>lua require'dap'.step_over()<cr>",         desc = "Step over" },
        { "<F11>",      "<cmd>lua require'dap'.step_into()<cr>",         desc = "Step into" },
        { "<F5>",       "<cmd>lua require'dap'.continue()<cr>",          desc = "Continue" },
        { "<F9>",       "<cmd>lua require'dap'.step_out()<cr>",          desc = "Step out" },
        { "<leader>d",  group = "Debug" },
        { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
        { "<leader>dc", "<cmd>lua require'dapui'.close()<cr>",           desc = "Close DAP UI" },
        { "<leader>dl", "<cmd>lua require'dap'.continue()<cr>",          desc = "Launch debug session" },
        { "<leader>do", "<cmd>lua require'dapui'.open()<cr>",            desc = "Open DAP UI" },
        {
          "<leader>dt",
          "<cmd>lua require'dap'.terminate()<cr><cmd>lua require'dapui'.close()<cr>",
          desc = "Terminate debug session",
        },
        { "<leader>dw", "<cmd>lua require'dapui'.toggle()<cr>",                               desc = "Toggle DAP UI" },
        { "<s-F5>",     "<cmd>lua require'dap'.disconnect({ terminateDebuggee = true })<cr>", desc = "Disconnect" },
      })
    end,
  },
}
