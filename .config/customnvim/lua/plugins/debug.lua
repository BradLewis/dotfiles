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
      o = { "<cmd>lua require'dapui'.open()<cr>", "Open DAP UI" },
      c = { "<cmd>lua require'dapui'.close()<cr>", "Close DAP UI" },
      w = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle DAP UI" },
    },
  },
  ["<F11>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
  ["<F10>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
  ["<F9>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
  ["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  ["<s-F5>"] = { "<cmd>lua require'dap'.disconnect({ terminateDebuggee = true })<cr>", "Disconnect" },
})

return M
