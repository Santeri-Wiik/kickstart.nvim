return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  textobjects = {
    select = {
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
      },
    },
  },
}
