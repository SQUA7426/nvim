vim.g.mapleader = ' '      -- set the mapleader to Space
vim.g.maplocalleader = ' ' -- the same as mapleader

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set({ 'n', 'v' }, '<C-N>', '<Nop>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-P>', '<Nop>', opts)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

vim.keymap.set({ 'n', 'v' }, '<leader>j', ']mzf%', { desc = "[c]reate folding inside brackets" })
vim.keymap.set({ 'n', 'v' }, '<leader>jj', 'zo', { desc = "open folding under cursor" })
vim.keymap.set({ 'n', 'v' }, '<leader>jjj', 'zR', { desc = "Open all foldings" })
vim.keymap.set({ 'n', 'v' }, '<leader>jc', 'zc', { desc = "[c]lose folding under cursor" })
vim.keymap.set({ 'n', 'v' }, '<leader>jC', 'zM', { desc = "[C]lose all foldings" })
vim.keymap.set({ 'n', 'v' }, '<leader>jd', 'zd', { desc = "[d]elete fold under cursor" })


--- Example integration with Tabnine and LuaSnip; falling back to inserting tab if neither has a completion
vim.keymap.set("i", "<tab>", function()
    if require("tabnine.keymaps").has_suggestion() then
        return require("tabnine.keymaps").accept_suggestion()
    elseif require("luasnip").jumpable(1) then
        return require("luasnip").jump(1)
    else
        return "<tab>"
    end
end, { expr = true })

-- Tabnine Enable and Disable
vim.keymap.set('n', '<leader>tn', ':TabnineEnable<CR>', { desc = 'Enable Tabnine' })
vim.keymap.set('n', '<leader>td', ':TabnineDisable<CR>', { desc = 'Disable Tabnine' })

-- Copilot Enable and Disable
vim.keymap.set('n', '<leader>cn', ':Copilot enable<CR>', { desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { desc = 'Disable Copilot' })
-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)
-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete a single char w/o copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- find the center
vim.keymap.set('n', 'n', '50%<CR>', opts)
-- vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- goto line : (number)gg


-- showkeysToggle
vim.keymap.set('n', '<leader>sk', ':ShowkeysToggle<CR>', { desc = "Toggling Showkeys" })


-- disable CR in 'n' and 'v'
opts.desc = 'disable CR'
vim.api.nvim_set_keymap('n', '<CR>', '<Nop>', opts)
vim.api.nvim_set_keymap('v', '<CR>', '<Nop>', opts)

opts.desc = 'Jump to last char/letter'
vim.api.nvim_set_keymap('n', 'E', '$', opts)
vim.api.nvim_set_keymap('v', 'E', '$', opts)

vim.cmd("source ~/.config/nvim/lua/squa/plugins/exec.vim")
-- Resize with arrows
-- vim.keymap.set( 'n', '<Up>', ':resize -2<CR>', opts )
-- vim.keymap.set( 'n', '<Down>', ':resize +2<CR>', opts)
-- vim.keymap.set( 'n', '<Left>', ':vertical resize -2<CR>', opts )
-- vim.keymap.set( 'n', '<Right>', ':vertical resize +2<CR>', opts)

-- Disable arrows
vim.keymap.set('n', '<Up>', ':echo "use k!"<CR>', opts)
vim.keymap.set('n', '<Down>', ':echo "use j!"<CR>', opts)
vim.keymap.set('n', '<Left>', ':echo "use h!"<CR>', opts)
vim.keymap.set('n', '<Right>', ':echo "use l!"<CR>', opts)

-- Disable / Enable Tabnine
vim.keymap.set('n', '<leader>mm', ':TabnineDisable<CR>', { desc = 'Tabnine: disable' })
vim.keymap.set('n', '<leader>m', ':TabnineEnable<CR>', { desc = 'Tabnine: enable' })

-- Dis-/ able copilot
-- vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { desc = 'Copilot: disable' })
-- vim.keymap.set('n', '<leader>ce', ':Copilot enable<CR>', { desc = 'Copilot: enable' })

-- Buffers
opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'previous buffer' })
-- vim.keymap.set( 'n', '<leader>x', ':Bdelete!<CR>', opts )
vim.keymap.set('n', '<leader>b', ':<cmd> enew <CR>', { desc = 'new buffer' })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = "[V]ertical Split" })   -- vertical split
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = "[H]orizontal Split" }) -- horizontal split
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close buffer' })

-- Navigation between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Taps
-- vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
-- vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
-- vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)
-- vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd> set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)


-- -- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'goto previous Diagnostic' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'goto next Diagnostic' })
-- -- vim.keymap.set( 'n', '<leader>d', vim.diagnostic.open_float, { desc = 'Diagnostic: open float'} )
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic: set loc list' })


-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)
vim.keymap.set('t', '<C-e>', '<cmd> q <CR> :bnext<CR> :Bdelete!<CR>', opts)
vim.keymap.set('t', '<C-q>', '<C-\\><C-n> :wincmd h<CR>', opts)
vim.keymap.set('n', '<C-t>', function()
    vim.cmd('split')
    vim.cmd.term()
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 20)
end, { desc = 'Open terminal' })

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

vim.keymap.set('n', '<space>t', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd('L')
    vim.api.nvim_win_set_width(0, 80)
end, { desc = 'Open terminal' })


local function compile_and_run_java()
    vim.ui.input('record time? y/n: ', function(accept_time)
        if accept_time == 'y' or accept_time == 'yes' then
            vim.ui.input('Enter package name: ', function(package_name)
                if package_name then
                    local file_name_without_extension = vim.fn.expand('%:t:r')            -- Dateiname ohne Erweiterung
                    local class_name = package_name ..
                    '/' .. file_name_without_extension                                    -- Kombiniere Paketnamen und Dateinamen

                    vim.cmd('term cd ' ..
                    vim.fn.expand('%:p:h') ..
                    ' && javac *.java && cd .. && time java ' .. class_name .. ' < /dev/null > /dev/null')
                end
            end)
        else
            vim.ui.input('Enter package name: ', function(package_name)
                if package_name then
                    local file_name_without_extension = vim.fn.expand('%:t:r')            -- Dateiname ohne Erweiterung
                    local class_name = package_name ..
                    '/' .. file_name_without_extension                                    -- Kombiniere Paketnamen und Dateinamen

                    vim.cmd('term cd ' .. vim.fn.expand('%:p:h') .. ' && javac *.java && cd .. && java ' .. class_name)
                end
            end)
        end
    end)
end

vim.api.nvim_create_augroup('exe_code', { clear = false })

vim.api.nvim_create_autocmd('FileType', {
    group = 'exe_code',
    pattern = 'java',
    callback = function()
        vim.keymap.set('n', '<C-P>', compile_and_run_java, { noremap = true, silent = true })
    end,
})

vim.keymap.set('n', '<C-P>', ':term octave % <CR>', { noremap = true, silent = true })

local function compile_and_Args()
    vim.ui.input('Enter package name: ', function(package_name)
        if package_name then
            vim.ui.input('Enter Arguments: ', function(arguments)
                if arguments then
                    local file_name_without_extension = vim.fn.expand('%:t:r') -- Dateiname ohne Erweiterung
                    local class_name = package_name ..
                    '/' .. file_name_without_extension                      -- Kombiniere Paketnamen und Dateinamen

                    vim.cmd('term cd ' ..
                    vim.fn.expand('%:p:h') .. ' && javac *.java && cd .. && java ' .. class_name .. ' ' .. arguments)
                end
            end)
        end
    end)
end

vim.api.nvim_create_augroup('exe_code', { clear = false })

vim.api.nvim_create_autocmd('FileType', {
    group = 'exe_code',
    pattern = 'java',
    callback = function()
        vim.keymap.set('n', '<C-Ü>', compile_and_Args, { noremap = true, silent = true })
    end,
})


local function run_sql()
    vim.ui.input('Enter database_name: ', function(db_name)
        if db_name then
            vim.cmd('term cd ' .. vim.fn.expand('%:p:h') .. ' && sudo psql -U timothy -d ' .. db_name)
        end
    end)
end

vim.api.nvim_create_augroup('exe_code', { clear = false })

vim.api.nvim_create_autocmd('FileType', {
    group = 'exe_code',
    pattern = 'sql',
    callback = function()
        vim.keymap.set('n', '<C-P>', run_sql, { noremap = true, silent = true })
    end,
})
