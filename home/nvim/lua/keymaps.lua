vim.keymap.set('n', '<C-Tab>', ":bn<CR>", {})
vim.keymap.set('n', '<C-S-Tab>', ":bp<CR>", {})
vim.keymap.set('n', '<C-S-w>', ":bw<CR>", {})
vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", {})
vim.keymap.set('n', '<leader>t', ":ToggleTerm<CR>", {})
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", {})

vim.keymap.set('v', 'p', 'P', {})
