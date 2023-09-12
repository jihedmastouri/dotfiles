-- vim.api.nvim_create_augroup("GoOnLeave", { clear = true })
-- vim.api.nvim_create_autocmd("BufLeave", {
--   group = "GoOnSave",
--   callback = function()
--     vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
--   end,
-- })

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
