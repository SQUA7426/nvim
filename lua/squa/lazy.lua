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
        -- require 'squa.plugins.lsp.copilot',
        -- not lsp
        require 'squa.plugins.autopairs',
        require 'squa.plugins.bufferline',
        require 'squa.plugins.colortheme',
        require 'squa.plugins.comrade',
        require 'squa.plugins.dressing',
        require 'squa.plugins.flash',
        require 'squa.plugins.lualine',
        require 'squa.plugins.neotree',
        require 'squa.plugins.nvim-cmp',
        require 'squa.plugins.showkeys',
        require 'squa.plugins.telescope',
        require 'squa.plugins.treesitter',
        require 'squa.plugins.whichkey',
    }
})
