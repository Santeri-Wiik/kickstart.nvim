vim.pack.add({{
    src = 'https://github.com/jalvesaq/dict.nvim'
}})

require'dict'.setup({
    dict = 'wn',
    dict_dir = '/usr/share/dictd',
    cache_dir = vim.env.HOME .. '/.cache/dict.nvim',
})

vim.keymap.set('n', '<Leader>d', '<Cmd>lua require("dict").lookup()<CR>')
