-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")

    map("gr", require("telescope.builtin").lsp_references, "Go to references")

    map("gt", require("telescope.builtin").lsp_type_definitions, "Go to type definition")

    -- map("gR", require("telescope.builtin").lsp_references, "Go to references")

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
  end,
})
