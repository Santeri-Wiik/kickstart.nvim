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

-- Imports
return {
  {
    'debugloop/telescope-undo.nvim',
    dependencies = { -- note how they're inverted to above example
      {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
    },
    opts = {
      -- don't use `defaults = { }` here, do this in the main telescope spec
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = 'vertical',
          -- telescope-undo.nvim config, see below
        },
        -- no other extensions here, they can have their own spec too
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require('telescope').setup(opts)
      require('telescope').load_extension 'undo'
    end,
    event = 'VimEnter',
  },

  {
    'm4xshen/autoclose.nvim',
    config = function(_)
      require('autoclose').setup()
    end,
  },
}
