-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  init = function()
    -- Automatically open NeoTree when starting in a directory
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        local is_directory = vim.fn.isdirectory(vim.fn.expand '%:p')
        if is_directory == 1 then
          require('neo-tree.command').execute { toggle = true, dir = vim.fn.getcwd() }
        end
      end,
    })
  end,
}
