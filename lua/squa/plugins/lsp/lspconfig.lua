return
{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "[S]how L[S]P references"
            keymap.set("n", "gss", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Go to d[ec]laration"
            keymap.set("n", "ec", vim.lsp.buf.declaration, opts)

            opts.desc = "Show LSP d[e]finitions"
            keymap.set("n", "ee", "<cmd>Telescope lsp_definitions<CR>", opts)

            -- opts.desc = "Show LSP implementations"
            -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

            -- opts.desc = "Show LSP type definitions"
            -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "See available [c]ode [a]ctions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "S[m]art [r]ena[m]e"
            keymap.set("n", "<leader>rm", vim.lsp.buf.rename, opts)

            -- opts.desc = "Show buffer diagnostics"
            -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            -- opts.desc = "Show line diagnostics"
            -- keymap.set("n", "<leader>d", vim.diagnostic.open.float, opts)

            -- opts.desc = "Goto previous diagnostic"
            -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

            -- opts.desc = "Goto next diagnostic"
            -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = "⚔ ", Warn = "⚠ ", Hint = "⨁ ", Info = "ℹ " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server
        lspconfig["matlab_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["sqlls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure emmet server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure pyright server
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["asm_lsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["graphql"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        require 'lspconfig'.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = {
                ["window/showMessage"] = function(err, method, params, client_id)
                    print(vim.inspect(params))
                end,
            },
        })

        lspconfig["jdtls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        require 'lspconfig'.lua_ls.setup {
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
    end,
}
