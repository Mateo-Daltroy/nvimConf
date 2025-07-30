local set = vim.opt_local

set.number = false
set.relativenumber = false

vim.opt.wrap = true -- Line Wrap
vim.opt.linebreak = true -- Las palabras no quedan por la mitad
vim.opt.breakindent = true -- Indent en wrapped lines

-- Moverse en cuanto a las lineas visuales, no las reales
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

vim.schedule(function()
  -- Enable ZenMode when opening Markdown
  if vim.bo.filetype == 'markdown' and not require('zen-mode.view').is_open() then
    vim.cmd 'ZenMode'
  end
end)

--[[ Auto-disable ZenMode when leaving Markdown
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md",
    callback = function()
        if require("zen-mode.view").is_open() then
            vim.cmd("ZenMode")  -- Toggle off ZenMode
        end
    end
})
--[[
vim.schedule(function()
    if not require("zen-mode.view").is_open() then
        vim.cmd("ZenMode")
    end
    vim.cmd("redraw!")   -- Refresh screen
    vim.cmd("normal! zz")  -- Center cursor
end)
--]]
