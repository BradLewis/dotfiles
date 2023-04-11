local function ensure_uri_scheme(uri)
  if not vim.startswith(uri, "file://") then
    return "file://" .. uri
  end
  return uri
end

local function is_in_workspace(uri)
  uri = ensure_uri_scheme(uri)
  local path = vim.uri_to_fname(uri)
  local workspace_dir = vim.fn.getcwd()

  return vim.startswith(path, workspace_dir)
end

local function filter_diagnostics(diagnostics)
  local filtered_diagnostics = {}
  for _, diagnostic in ipairs(diagnostics) do
    if is_in_workspace(diagnostic.source) then
      table.insert(filtered_diagnostics, diagnostic)
    end
  end
  return filtered_diagnostics
end

local M = {
  {
    "simrat39/rust-tools.nvim",
    opts = function(_, opts)
      local rt = require("rust-tools")
      local lspconfig = require("lspconfig")

      local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib" -- MacOS: This may be .dylib

      opts.server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        end,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--all", "--", "-W", "clippy::all" },
            },
          },
        },
        root_dir = function(startpath)
          local startpath_uri = vim.uri_from_fname(startpath)
          if not is_in_workspace(startpath) then
            return nil
          end

          return lspconfig.util.root_pattern("Cargo.toml", "rust-project.json")(startpath)
        end,
      }

      opts.dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      }
    end,
  },
  {
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" },
      })
    end,
  },
}

require("which-key").register({
  ["<leader>"] = {
    r = {
      name = "Rust",
      h = { "<cmd>lua require'rust-tools'.hover_actions.hover_actions()<cr>", "Hover actions" },
      a = { "<cmd>lua require'rust-tools'.code_action_group.code_action_group()<cr>", "Code actions" },
      r = { "<cmd>wa<cr><cmd>lua require'rust-tools'.runnables.runnables()<cr>", "Runnables" },
      d = { "<cmd>wa<cr><cmd>lua require'rust-tools'.debuggables.debuggables()<cr>", "Debuggables" },
    },
  },
})

return M
