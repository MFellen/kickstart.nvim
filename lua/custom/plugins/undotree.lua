return {
  -- other plugins...
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', ':UndotreeToggle<CR>', desc = 'Toggle Undo Tree' },
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1 -- Focus on the undotree window when toggled
    end,
  },
}
