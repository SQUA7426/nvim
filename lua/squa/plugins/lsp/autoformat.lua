return
{
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                svelte = { { "prettierd", "prettier" } },
                javascript = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
                javascriptreact = { { "prettierd", "prettier" } },
                typescriptreact = { { "prettierd", "prettier" } },
                json = { { "prettierd", "prettier" } },
                graphql = { { "prettierd", "prettier" } },
                java = { { "google-java-format", "prettier" } },
                kotlin = { "ktlint" },
                ruby = { "standardrb" },
                markdown = { { "prettierd", "prettier" } },
                erb = { "htmlbeautifier" },
                html = { "htmlbeautifier" },
                bash = { "beautysh" },
                proto = { "buf" },
                rust = { "rustfmt" },
                yaml = { "yamlfix" },
                toml = { "tablo" },
                css = { { "prettierd", "prettier" } },
                scss = { { "prettierd", "prettier" } },
                sql = { "sql-formatter" },
            }
        })
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
