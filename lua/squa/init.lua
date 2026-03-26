require('squa.core.keymaps')
require('squa.core.options')
require('squa.lazy')
require('luasnip')
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
