local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- before : sudo apt-get install imagemagick
-- then: sudo apt install liblua5.1-0-dev / sudo pacman -S lua lualib
-- then: luarocks install image.nvim
-- sudo install fd / sudo pacman -S fd

require('lazy').setup({
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        "mg979/vim-visual-multi",
    },
    {
        -- pacman -S --needed gtk3 glib2 webkit2gtk-4.1 libsoup3
        "codota/tabnine-nvim",
        build = "./dl_binaries.sh"
    },
    {
        -- lsp
        require 'squa.plugins.lsp.lspconfig',
        require 'squa.plugins.lsp.mason',
        require 'squa.plugins.lsp.autoformat',
        require 'squa.plugins.lsp.copilot',
        -- not lsp
        require 'squa.plugins.autopairs',
        require 'squa.plugins.bufferline',
        require 'squa.plugins.colorschemes.sonokai',
        require 'squa.plugins.colorschemes.cyberdream',
        require 'squa.plugins.colorschemes.solarized',
        require 'squa.plugins.comrade',
        require 'squa.plugins.dressing',
        require 'squa.plugins.flash',
        require 'squa.plugins.lualine',
        require 'squa.plugins.neotree',
        require 'squa.plugins.nvim-cmp',
        require 'squa.plugins.showkeys',
        require 'squa.plugins.telescope',
        require 'squa.plugins.treesitter',
        require 'squa.plugins.vim-dadbod',
        require 'squa.plugins.whichkey',
        require 'squa.plugins.noicenvim'
    }
})

require('tabnine').setup({
    disable_auto_comment = true,
    accept_keymap = "<Tab>",
    dismiss_keymap = "<C-]>",
    debounce_ms = 800,
    suggestion_color = { gui = "#808080", cterm = 244 },
    exclude_filetypes = { "TelescopePrompt", "NvimTree" },
    log_file_path = nil, -- absolute path to Tabnine log file
    ignore_certificate_errors = false,
    -- workspace_folders = {
    --   paths = { "/your/project" },
    --   get_paths = function()
    --       return { "/your/project" }
    --   end,
    -- },
})

require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,     -- use a classic bottom cmdline for search
        command_palette = true,   -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,   -- add a border to hover docs and signature help
    },
    messages = {
        enabled = false,
        view = "popup",
    },
    errors = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = { error = true },
        filter_opts = { reverse = true },
    },
    notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = false,
        view = "cmdline",
    },
})
