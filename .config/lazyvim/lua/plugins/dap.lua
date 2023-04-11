local M = {
  "mfussenegger/nvim-dap",

  dependencies = {
    {
      "rcarriga/nvim-dap-ui",

      config = function()
        require("dapui").setup()
      end,
    },
  },
}

function M.config()
  local dap, dapui = require("dap"), require("dapui")
  dapui.setup({})
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
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/" .. "", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      initCommand = {},
      runInTerminal = true,
    },
  }
end

require("which-key").register({
  ["<leader>"] = {
    d = {
      name = "Debug",
      b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
      l = {
        "<cmd>lua require'dap'.continue()<cr>",
        "Launch debug session",
      },
      t = { "<cmd>lua require'dap'.terminate()<cr><cmd>lua require'dapui'.close()<cr>", "Terminate debug session" },
    },
  },
  ["<F11>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
  ["<F10>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
  ["<F9>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
  ["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  ["<s-F5>"] = { "<cmd>lua require'dap'.disconnect({ terminateDebuggee = true })<cr>", "Disconnect" },
})

return M
