vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>h", ":set hls!<CR>", { desc = "Toggle search highlights" })

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save with CTRL+S" })
keymap.set("n", "<leader><leader>", function()
    vim.cmd("source %")
end)

-- window management

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sm", "<C-w>_<C-w>|", { desc = "Maximize current split" })
keymap.set("n", "<leader>sn", "<C-w>n", { desc = "Maximize current split" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

