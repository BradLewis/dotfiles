return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",

      { "j-hui/fidget.nvim", opts = {} },

      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")

          map(
            "gr",
            "<cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = { '%.spec.ts', '%_test.go' } })<cr>",
            "Go to references (ignoring test files)"
          )

          map("gI", require("telescope.builtin").lsp_implementations, "Go to implementation")

          map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Show type definitions")

          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Show document symbols")

          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Show workspace symbols")

          map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")

          map("<leader>ca", vim.lsp.buf.code_action, "Show code actions")

          map("K", vim.lsp.buf.hover, "Hover Documentation")

          map("gD", vim.lsp.buf.declaration, "Go to declaration")

          map("<leader>sD", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")

          map("<leader>sd", vim.diagnostic.open_float, "Show line diagnostics")

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        gopls = {},
        rust_analyzer = {},
        tsserver = {},

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
        "golines",
        "eslint_d",
        "black",
        "isort",
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
