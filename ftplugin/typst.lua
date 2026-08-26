local winid = vim.api.nvim_get_current_win()

vim.bo.textwidth = 80
vim.wo[winid][0].spell = true
