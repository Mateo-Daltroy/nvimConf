-- custom window for markdown files
-- igual no tienen que ser si o si markdown, se togglea con :ZenMode
return {
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        height = 1,
        width = 110,
        -- backdrop = 0.95,
      },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
