require("which-key").register({
  ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<cr>", "Go to left window" },
  ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<cr>", "Go to down window" },
  ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<cr>", "Go to up window" },
  ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<cr>", "Go to right window" },
  ["<C-\\>"] = { "<cmd>NvimTmuxNavigateLastActive<cr>", "Go to last active window" },
  ["<C-Space>"] = { "<cmd>NvimTmuxNavigateNext<cr>", "Go to next window" },
  ["<Leader>"] = {
    q = { name = "quit/session", q = { "<cmd>qa<cr>", "Quit all" } },
    w = {
      f = { "<cmd>bp|bd #<cr>", "Close file" },
    },
  },
})
