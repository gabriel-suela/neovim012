local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl" })
map("n", "<leader>sf", ":Pick files<CR>", opts)
map("n", "<leader>sg", ":Pick grep_live<CR>", opts)
map("n", "<leader>sh", ":Pick help<CR>", opts)
map("n", "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "format file" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
map("n", "<leader>qq", ":wqa<CR>")

map("n", "<leader>e", "<cmd>Neotree toggle<CR>")
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-s>", ":w<CR>", { desc = "save file" })

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "go to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "go to bottom" })
map("n", "<C-k>", "<C-w>k", { desc = "go to top" })
