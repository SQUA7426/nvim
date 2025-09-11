return
{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",           -- source for text in buffer
        "hrsh7th/cmp-path",             -- source for file system paths
        "L3MON4D3/LuaSnip",             --snippet engine
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets for other languages
        -- "honza/vim-snippets",
        -- "SirVer/ultisnips",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        -- loads vs code style snippets from installed plugins
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                enxpand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- Jump backward in snippet
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                -- ["<C-f>"] = cmp.mapping.scroll_docs(4),

                ["<C-Space>"] = cmp.mapping.complete(), -- show complete suggestion
                ["<C-e>"] = cmp.mapping.abort(),        -- close complete window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- sources for autocomletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, --snippets
                { name = "buffer" },  -- text within current buffer
                { name = "path" },    -- file system paths
            }),
            preselect = cmp.PreselectMode.None,
        })
    end,
}
