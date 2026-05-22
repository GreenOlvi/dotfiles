return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        })

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            -- default handler for installed servers
            function(server_name)
                local lspconfig = require("lspconfig")
                vim.lsp.config(server_name, { capabilities = capabilities })
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "html",
                "cssls",
                "lua_ls",
                "pyright",
                "eslint",
                -- "omnisharp",
                "clangd",
                "dockerls",
                "jsonls",
            },
        })

        local mason_tool_installer = require("mason-tool-installer")

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "cpplint",
                "netcoredbg",
            },
        })
    end,
}
