local ignored_file_patterns =
  "{ 'node_modules/', 'vendor/', 'target/', '.github/', '.gitlab/', '%.spec.ts', '%_test.go', '%-lock.json', 'Cargo.lock', '.terraform/' }"

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
          "node_modules/",
          "vendor/",
          "target/",
        },
      },
    })

    telescope.load_extension("fzf")
  end,
  keys = {
    {
      "<leader><space>",
      "<cmd>lua require('telescope.builtin').find_files({file_ignore_patterns = " .. ignored_file_patterns .. " })<cr>",
      desc = "Find Files (ignoring files)",
    },
    {
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    -- find
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
    -- {
    --   "<leader>ff",
    --   "<cmd>lua require('telescope.builtin').find_files({file_ignore_patterns = " .. ignored_file_patterns .. " })<cr>",
    --   desc = "Find files (ignoring test files)",
    -- },
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      { desc = "Fuzzy find recent files" },
    },
    -- search
    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>sG", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
    {
      "<leader>sg",
      "<cmd>lua require('telescope.builtin').live_grep({file_ignore_patterns = " .. ignored_file_patterns .. " })<cr>",
      desc = "Grep in files (ignoring files)",
    },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" } },
  },
}
