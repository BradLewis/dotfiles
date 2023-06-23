-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.python3_host_prog = vim.env.HOME .. "/.virtualenvs/nvim/bin/python"

require("config.lazy")
