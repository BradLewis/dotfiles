local M = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
function M.format_on_save(current_client, bufnr)
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
end

return M
