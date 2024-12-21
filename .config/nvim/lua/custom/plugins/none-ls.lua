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

    -- register odinfmt with null-ls
    local odinfmt = {
      name = "odinfmt",
      method = require("null-ls.methods").internal.FORMATTING,
      filetypes = { "odin" },
      generator = null_ls.formatter({
        command = "sh",
        args = { "-c", "odinfmt", "-w", "$FILENAME" },
        to_stdin = true,
      }),
    }
    null_ls.register(odinfmt)

    local rustfmt = {
      name = "rustfmt",
      method = require("null-ls.methods").internal.FORMATTING,
      filetypes = { "rust" },
      generator = null_ls.formatter({
        command = "rustfmt",
        args = { "--emit=stdout", "--edition=2024" },
        to_stdin = true,
      }),
    }
    null_ls.register(rustfmt)

    null_ls.setup({
      root_dir = null_ls_utils.root_pattern(
        ".null-ls-root",
        "Makefile",
        ".git",
        "package.json",
        "Cargo.toml",
        "go.mod"
      ),
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
        -- formatting.odinfmt,
      },
      on_attach = require("custom.helpers.format").format_on_save,
    })
  end,
}
