-- Binding que permite guardar y compilar el archivo
vim.keymap.set('n', '<leader>f', ':w<CR>:!fpc %<CR>', { silent = true })
