vim.api.nvim_create_augroup("GoOnLeave", { clear = true })
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
  end,
})
