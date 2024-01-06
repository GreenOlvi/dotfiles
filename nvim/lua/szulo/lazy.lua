local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'rose-pine/neovim', name = 'rose-pine' },
    {
        'folke/tokyonight.nvim',
        name = 'tokyonight',
	lazy = false,
        config = function()
            vim.cmd('colorscheme tokyonight')
        end
    },

    { 'nvim-lualine/lualine.nvim', lazy = false, dependencies = { 'nvim-tree/nvim-web-devicons' } },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        opts =
        {
            ensure_installed = { "c_sharp", "c", "lua", "vim", "vimdoc", "query", "rust" },
            sync_install = false,
            auto_install = true,
            higlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
})
