vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save with CTRL+S" })
keymap.set("n", "<leader><leader>", function()
    vim.cmd("source %")
end)

keymap.set("n", "Q", "<nop>")

-- window management

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sm", "<C-w>_<C-w>|", { desc = "Maximize current split" })
keymap.set("n", "<leader>sn", "<C-w>n", { desc = "Maximize current split" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- move selection

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- options switch
keymap.set("n", "<leader>w", ":set wrap!<CR>", { desc = "Toggle word wrap" })
keymap.set("n", "<leader>h", ":set hls!<CR>", { desc = "Toggle search highlights" })
keymap.set("n", "<leader>l", ":set list!<CR>", { desc = "Toggle invisible chars" })
