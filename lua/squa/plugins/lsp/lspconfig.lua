return
{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- local capabilities = cmp_nvim_lsp.default_capabilities()
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        local signs = { Error = "⚔ ", Warn = "⚠ ", Hint = "⨁ ", Info = "ℹ " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure html server
        -- lspconfig["html"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("html")
        vim.lsp.config("html", {
            capabilities = capabilities,
        })

        -- configure typescript server
        -- lspconfig["matlab_ls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("matlab_ls")
        vim.lsp.config("matlab_ls", {
            capabilities = capabilities,
        })

        -- configure css server
        -- lspconfig["cssls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("cssls")
        vim.lsp.config("cssls", {
            capabilities = capabilities,
        })

        -- lspconfig["sqls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("sqls")
        vim.lsp.config("sqls", {
            capabilities = capabilities,
        })

        -- lspconfig["sqlls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("sqlls")
        vim.lsp.config("sqlls", {
            capabilities = capabilities,
        })

        -- configure tailwindcss server
        -- lspconfig["tailwindcss"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("tailwindcss")
        vim.lsp.config("tailwindcss", {
            capabilities = capabilities,
        })
        -- configure json server
        -- lspconfig["jsonls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("jsonls")
        vim.lsp.config("jsonls", {
            capabilities = capabilities,
        })
        -- configure bash server
        -- lspconfig["bashls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("bashls")
        vim.lsp.config("bashls", {
            capabilities = capabilities,
        })

        -- configure arduino-language-server
        -- lspconfig["arduino_language_server"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("arduino_language_server")
        vim.lsp.config("arduino_language_server", {
            capabilities = capabilities,
        })
        -- configure pkgbuild server
        -- lspconfig["pkgbuild_language_server"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        -- configure jave-language-server
        -- lspconfig["java_language_server"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        -- configure emmet server
        -- lspconfig["emmet_ls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     filetypes = { "html", "css", "sass", "scss", "less", "svelte" },
        -- })
        vim.lsp.enable("emmet_ls")
        vim.lsp.config("emmet_ls", {
            capabilities = capabilities,
            filetypes = { "html", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure pyright server
        -- lspconfig["pyright"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("pyright")
        vim.lsp.config("pyright", {
            capabilities = capabilities,
        })

        -- lspconfig["asm_lsp"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        -- lspconfig["graphql"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        vim.lsp.enable("graphql")
        vim.lsp.config("graphql", {
            capabilities = capabilities,
        })
        -- lspconfig["rust_analyzer"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        vim.lsp.enable("rust_analyzer")
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
        })
        -- lspconfig["cmake"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("cmake")
        vim.lsp.config("cmake", {
            capabilities = capabilities,
        })

        -- lspconfig["clangd"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        -- require 'lspconfig'.clangd.setup({
        vim.lsp.config("clangd", {
            capabilities = capabilities,
            -- on_attach = on_attach,
            handlers = {
                ["window/showMessage"] = function(err, method, params, client_id)
                    print(vim.inspect(params))
                end,
            },
        })

        -- lspconfig["jdtls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("jdtls")
        vim.lsp.config("jdtls", {
            capabilities = capabilities,
        })

        -- lspconfig["texlab"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })
        vim.lsp.enable("texlab")
        vim.lsp.config("texlab", {
            capabilities = capabilities,
        })
        -- require 'lspconfig'.lua_ls.setup {
        vim.lsp.enable("lua_ls")
        vim.lsp.config("lua_ls", {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        }
        )
    end,
}
