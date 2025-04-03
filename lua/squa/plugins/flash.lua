return
{
    "folke/flash.nvim",
    event = "VeryLazy",
    --@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
        -- "f" -> marks lines after cursor => showing all of chars after this mark, but only 1 char, navigating with ; & ,
        { "ff",    mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash [jump]" },
        -- { "ll",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter [jump though blocks]" },
        -- { "z",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        -- { "L",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-a>", mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}
