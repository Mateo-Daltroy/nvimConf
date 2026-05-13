---@diagnostic disable: undefined-global
-- toggle lsp options
vim.keymap.set('n', '<space>i', ':lua vim.lsp.buf.code_action()<CR>', { desc = 'Muestra las acciones del LSP' })
