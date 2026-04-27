local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

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
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
  {
    "mg979/vim-visual-multi",
  },
  {
    "beeender/ComradeNeovim",
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    -- lsp
    require 'squa.plugins.lsp.lspconfig',
    require 'squa.plugins.lsp.mason',
    require 'squa.plugins.lsp.autoformat',
    require 'squa.plugins.lsp.copilot',
    require 'squa.plugins.lsp.nvim-metals',
    -- colorschemes
    require 'squa.plugins.colorschemes.sonokai',
    require 'squa.plugins.colorschemes.cyberdream',
    require 'squa.plugins.colorschemes.solarized',
    -- not lsp
    require 'squa.plugins.aerial',
    require 'squa.plugins.arduino',
    require 'squa.plugins.autopairs',
    require 'squa.plugins.bufferline',
    require 'squa.plugins.comrade',
    require 'squa.plugins.cord',
    require 'squa.plugins.flash',
    require 'squa.plugins.fterm',
    require 'squa.plugins.lualine',
    require 'squa.plugins.neotree',
    require 'squa.plugins.noicenvim',
    require 'squa.plugins.nvim-cmp',
    require 'squa.plugins.showkeys',
    require 'squa.plugins.smear-cursor',
    require 'squa.plugins.telescope',
    require 'squa.plugins.treesitter',
    require 'squa.plugins.vim-dadbod',
    require 'squa.plugins.vimtex',
    require 'squa.plugins.whichkey'
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
local language_servers = vim.lsp.get_clients()
for _, ls in ipairs(language_servers) do
  require('lspconfig')[ls].setup({
    capabilities = capabilities
  })
end

require('ufo').setup()
--
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})
