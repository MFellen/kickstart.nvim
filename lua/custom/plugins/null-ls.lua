return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.diagnostics.flake8.with { extra_args = { '--max-line-length', 120 } },
        null_ls.builtins.formatting.black, -- Use black for formatting
      },
    }

    -- Auto-format Python files on save
    vim.cmd [[
          autocmd BufWritePre *.py lua vim.lsp.buf.format()
          ]]
  end,
}
