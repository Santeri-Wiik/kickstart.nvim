do return end

vim.pack.add { {
  src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  version = 'main',
} }

require('nvim-treesitter-textobjects').setup{
  select = {
    lookahead = true
  }
}
