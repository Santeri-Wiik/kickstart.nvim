-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.diffopt = 'internal,filler,closeoff,linematch:100'
vim.opt.relativenumber = true
vim.opt.colorcolumn = '80'
vim.opt.scrolloff = 8
vim.opt.jumpoptions = 'clean,stack'

-- Keymaps
vim.keymap.set('n', '<leader>u', '<CMD>Telescope undo<CR>')
vim.keymap.set('n', '<leader>cd', '<CMD>cd %:p:h<CR> <CMD>pwd<CR>')
vim.keymap.set('n', '<leader>-', '<CMD>Explore<CR>')
vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<leader>p', '"_dP', { desc = '[P]ut over selection without yanking' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank selection to system clipboard' })
vim.keymap.set('v', '<leader>d', '"_d', { desc = '[D]elete selection without yanking' })

-- Commands
vim.api.nvim_create_user_command('H', function(opts)
  vim.cmd('vertical rightbelow help ' .. opts.fargs[1])
  vim.cmd 'vertical resize 95'
end, { nargs = 1, desc = 'Help on the right' })

vim.api.nvim_create_user_command('RE', function(...)
  vim.cmd 'vertical rightbelow split'
  vim.cmd 'vertical resize 95'
  if arg['n'] == 1 then
    vim.cmd('Explore ' .. arg[1])
  else
    vim.cmd 'Explore'
  end
end, { nargs = '?', desc = '[R]ight [E]xplore' })

if vim.g.neovide then
  require 'custom.neovide'
end

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
