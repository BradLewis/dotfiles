vim.g.mapleader = " "

local map = vim.keymap

map.set("n", "<leader>|", "<C-w>v", { desc = "Split window vertically" })
map.set("n", "<leader>_", "<C-w>s", { desc = "Split window horizontally" })
map.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map.set("n", "<leader>qq", "<cmd>quitall<CR>", { desc = "Quit all" }) -- quit all

map.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map.set("v", "<", "<gv", { desc = "Shift left" })
map.set("v", ">", ">gv", { desc = "Shift right" })

map.set("n", "<M-,>", "<c-w>5<")
map.set("n", "<M-.>", "<c-w>5>")

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers["signature_help"], {
  border = "single",
  close_events = { "CursorMoved", "BufHidden" },
})
map.set("i", "<c-s>", vim.lsp.buf.signature_help)
map.set("n", "<leader>fd", vim.lsp.buf.format)
