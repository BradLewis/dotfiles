return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources, {
      nls.builtins.formatting.black,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.prettierd,
    })
    -- opts.debug = true
  end,
}
