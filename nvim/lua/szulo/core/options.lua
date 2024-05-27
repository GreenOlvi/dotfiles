vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.syntax = "on"

-- disable swap file and backup
opt.swapfile = false
opt.backup = false

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent settings from current line

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case on search
opt.smartcase = true -- case sensitive when mixed case

opt.cursorline = true

-- turn on colors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,start,eol"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- undofile
if vim.fn.has("unix") == 0 then
    opt.undodir = os.getenv("USERPROFILE") .. "\\vimfiles\\undodir"
else
    opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

opt.undofile = true

-- search
opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "160"

opt.listchars = { space = "•", tab = ">~", trail = "-", nbsp = "%" }
