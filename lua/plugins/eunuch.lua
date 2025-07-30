-- Dependencia de obsidian: es el plugin que mantiene el comando :Rename
return {
  {
    'tpope/vim-eunuch',
    config = function()
      vim.cmd 'cnoreabbrev rename Rename'
    end,
  },
}
