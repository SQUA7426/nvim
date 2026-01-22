return
{
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    opts = function()
        local metals_config = require("metals").bare_config()
        metals_config.on_attach = function(client, bufnr)
            -- your on_attach function
            vim.g.mapleader = ' '      -- set the mapleader to Space
            vim.g.maplocalleader = ' ' -- the same as mapleader
            local keymap = vim.keymap
            local opts = { noremap = true, silent = true }
            opts.desc = "[S]how L[S]P references"
            vim.keymap.set("n", "<leader>gss", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Go to d[ec]laration"
            vim.keymap.set("n", "<leader>ec", vim.lsp.buf.declaration, opts)

            opts.desc = "Show LSP d[e]finitions"
            vim.keymap.set("n", "<leader>ee", "<cmd>Telescope lsp_definitions<CR>", opts)

            -- opts.desc = "Show LSP implementations"
            -- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

            -- opts.desc = "Show LSP type definitions"
            -- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "See available [c]ode [a]ctions"
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

            -- opts.desc = "S[m]art [r]ena[m]e"
            vim.keymap.set("n", "<leader>rm", vim.lsp.buf.rename, { desc = "Smart [r]ena[m]e" })

            -- opts.desc = "Show buffer diagnostics"
            -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            -- opts.desc = "Show line diagnostics"
            -- keymap.set("n", "<leader>d", vim.diagnostic.open.float, opts)

            -- opts.desc = "Goto previous diagnostic"
            -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

            -- opts.desc = "Goto next diagnostic"
            -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Show documentation for what is under cursor"
            -- keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end

        return metals_config
    end,
    config = function(self, metals_config)
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = self.ft,
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end
}
