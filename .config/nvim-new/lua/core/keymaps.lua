-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap -- for conciseness

-- use -- clear search highlights
map.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
map.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
map.set("n", "<leader>|", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map.set("n", "<leader>_", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- map.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- map.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- map.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- map.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- map.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

map.set("n", "<leader>qq", "<cmd>quitall<CR>", { desc = "Quit all" }) -- quit all
