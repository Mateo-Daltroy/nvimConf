return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false, -- The new plugin explicitly requires this to be false
    build = ':TSUpdate',
    config = function()
      -- Always present parsers, if non-available in the system
      -- they will be fetched and installed
      require('nvim-treesitter').install {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      }

      -- Highlighting is now handled by Neovim natively.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- 3. Equivalent to `indent = { enable = true, disable = { 'ruby' } }`
      -- Indentation is applied to all files EXCEPT Ruby.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function(args)
          -- Check the filetype of the current buffer
          local ft = vim.bo[args.buf].filetype
          if ft ~= 'ruby' then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
