local function detectGoHtmlTmpl()
  if vim.fn.search("{{") ~= 0 then
    vim.bo.filetype = "gohtmltmpl"
  end
end

vim.api.nvim_create_augroup("isHTMLGoTemp", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "isHTMLGoTemp",
  callback = detectGoHtmlTmpl(),
})

-- vim.cmd([[
-- augroup filetypedetect
--     autocmd!
--     " gohtmltmpl
--     autocmd BufRead,BufNewFile *.html lua detectGoHtmlTmpl()
-- augroup END
-- ]])
