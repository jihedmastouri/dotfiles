vim.api.nvim_create_augroup('GoOnSave', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = 'GoOnSave',
  pattern = 'go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end,
})
