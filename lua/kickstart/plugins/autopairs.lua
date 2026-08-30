-- autopairs
-- https://github.com/windwp/nvim-autopairs

vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
local npairs = require 'nvim-autopairs'
npairs.setup {}
local Rule = require 'nvim-autopairs.rule'

npairs.add_rule(Rule('$', '$', 'typst'))
