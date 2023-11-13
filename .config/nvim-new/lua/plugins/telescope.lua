return {
  "nvim-telescope/telescope.nvim",
  event = "BufWinEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        dynamic_preview_title = true,
        file_ignore_patterns = {
          ".git/",
          "node_modules",
          "vendor",
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set(
      "n",
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      { desc = "Switch Buffer" }
    )
  end,
  keys = {
    {
      "<leader>sG",
      "<cmd>lua require('telescope.builtin').live_grep({file_ignore_patterns = { '%.spec.ts' } })<cr>",
      desc = "Grep in files (ignoring test files)",
    },
    {
      "<leader>fF",
      "<cmd>lua require('telescope.builtin').files({file_ignore_patterns = { '%.spec.ts' } })<cr>",
      desc = "Find files (ignoring test files)",
    },
    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  },
}
