-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_del_keymap("n", "<C-h>")
vim.api.nvim_del_keymap("n", "<C-j>")
vim.api.nvim_del_keymap("n", "<C-k>")
vim.api.nvim_del_keymap("n", "<C-l>")

require("which-key").register({
  ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<cr>", "Go to left window" },
  ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<cr>", "Go to down window" },
  ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<cr>", "Go to up window" },
  ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<cr>", "Go to right window" },
  ["<C-\\>"] = { "<cmd>NvimTmuxNavigateLastActive<cr>", "Go to last active window" },
  ["<C-Space>"] = { "<cmd>NvimTmuxNavigateNext<cr>", "Go to next window" },
  ["<Leader>"] = {
    w = {
      f = { "<cmd>bp|bd #<cr>", "Close file" },
    },
  },
})
