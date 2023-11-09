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

    -- local opts = {}
    -- opts.desc = "Show LSP references"
    -- keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
    --
    -- opts.desc = "Go to declaration"
    -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
    --
    -- opts.desc = "Show LSP definitions"
    -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
    --
    -- opts.desc = "Show LSP implementations"
    -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
    --
    -- opts.desc = "Show LSP type definitions"
    -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
    --
    -- opts.desc = "See available code actions"
    -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
    --
    -- opts.desc = "Smart rename"
    -- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
    --
    -- opts.desc = "Show buffer diagnostics"
    -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
    --
    -- opts.desc = "Show line diagnostics"
    -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
    --
    -- opts.desc = "Go to previous diagnostic"
    -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
    --
    -- opts.desc = "Go to next diagnostic"
    -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
    --
    -- opts.desc = "Show documentation for what is under cursor"
    -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
    --
    -- opts.desc = "Restart LSP"
    -- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
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
  },
}
