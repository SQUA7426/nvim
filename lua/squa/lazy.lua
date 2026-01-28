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
      "nvim-tree/nvim-web-devicons",       -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
  {
    "mg979/vim-visual-multi",
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh"
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
    require 'squa.plugins.autopairs',
    require 'squa.plugins.bufferline',
    require 'squa.plugins.comrade',
    require 'squa.plugins.cord',
    require 'squa.plugins.dressing',
    require 'squa.plugins.flash',
    require 'squa.plugins.fterm',
    require 'squa.plugins.lualine',
    require 'squa.plugins.neotree',
    require 'squa.plugins.noicenvim',
    require 'squa.plugins.nvim-cmp',
    require 'squa.plugins.PDFview',
    require 'squa.plugins.showkeys',
    require 'squa.plugins.telescope',
    require 'squa.plugins.treesitter',
    require 'squa.plugins.vim-dadbod',
    require 'squa.plugins.vimtex',
    require 'squa.plugins.whichkey'
  }
})

require('tabnine').setup({
  disable_auto_comment = true,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil,   -- absolute path to Tabnine log file
  ignore_certificate_errors = false,
})

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  messages = {
    enabled = false,
    view = "popup",
  },
  errors = {
    view = "popup",
    opts = { enter = true, format = "details" },
    filter = { error = true },
    filter_opts = { reverse = true },
  },
  notify = {
    enabled = false,
    view = "cmdline",
  },
})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pdf",
  callback = function()
    local file_path = vim.api.nvim_buf_get_name(0)
    require("pdfview").open(file_path)
  end,
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
