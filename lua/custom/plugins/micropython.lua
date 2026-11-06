vim.pack.add({
    {src = "https://github.com/jim-at-jibba/micropython.nvim"},
})

vim.keymap.set('n', '<leader>mr', require('micropython_nvim').run, { desc = '[M]icropython: [R]un current buffer' })
vim.keymap.set('n', '<leader>mu', require('micropython_nvim').upload_current, { desc = '[M]icropython: [U]pload current buffer' })
