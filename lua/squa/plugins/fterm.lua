return
{
  {
    'numToStr/FTerm.nvim',
    config = function()
      local fterm = require('FTerm')
      vim.keymap.set({ 'n', 't' }, '<leader>t', function() fterm:toggle() end, { desc = 'Toggle [T]erminal' })
    end,
  }
}
