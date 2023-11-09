return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    defaults = {
      ["<leader>t"] = { name = "+test" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>h"] = { name = "+harpoon" },
      ["<leader>f"] = { name = "+files" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>x"] = { name = "+trouble" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
