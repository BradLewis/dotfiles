return {
  "nvimtools/none-ls.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")

    local null_ls = require("null-ls")

    local null_ls_utils = require("null-ls.utils")

    mason_null_ls.setup({
      ensure_installed = {
        "prettierd",
        "stylua",
        "black",
        "eslint_d",
        "isort",
        "terraform_fmt",
        -- "rust_analyzer",
      },
    })

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json", "Cargo.toml"),
      sources = {
        formatting.prettierd.with({
          extra_filetypes = { "svelte" },
        }),
        formatting.stylua,
        formatting.isort,
        formatting.black,
        formatting.isort,
        formatting.golines.with({
          extra_args = { "-m", "128" },
        }),
        formatting.terraform_fmt,
      },
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
