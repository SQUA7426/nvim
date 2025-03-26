local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- require "squa.core",
-- before : sudo apt-get install imagemagick
-- then: sudo apt install liblua5.1-0-dev / sudo pacman -S lua lualib
-- then: luarocks install image.nvim
-- sudo install fd / sudo pacman -S fd
-- require "squa.plugins",

require('lazy').setup( "squa.plugins" )
