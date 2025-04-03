return
{
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")

        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➛",
                    package_uninstalled = "𐄂"
                }
            }
        })

        mason_lspconfig.setup({
            -- List of servers for mason to install
            ensure_installed = {
                "sqlls",
                "rust_analyzer",
                "asm_lsp",
                "clangd",
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                "lua_ls",
                "graphql",
                "emmet_ls",
                "prismals",
                "pyright",
                "jdtls",
                "matlab_ls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
    end,
}
