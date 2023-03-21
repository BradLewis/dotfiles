-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
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
    r = {
      name = "Rust",
      h = { "<cmd>lua require'rust-tools'.hover_actions.hover_actions()<cr>", "Hover actions" },
      a = { "<cmd>lua require'rust-tools'.code_action_group.code_action_group()<cr>", "Code actions" },
      r = { "<cmd>wa<cr><cmd>lua require'rust-tools'.runnables.runnables()<cr>", "Runnables" },
      d = { "<cmd>wa<cr><cmd>lua require'rust-tools'.debuggables.debuggables()<cr>", "Debuggables" },
    },
  },
  ["<F11>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
  ["<F10>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
  ["<F9>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
  ["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  ["<s-F5>"] = { "<cmd>lua require'dap'.disconnect({ terminateDebuggee = true })<cr>", "Disconnect" },
})
