vim.cmd([[
  let g:sonokai_enable_italic=1
  let g:sonokai_diagnostic_virtual_text='colored'
  let g:sonokai_diagnostic_text_highlight=1
  let g:sonokai_diagnostic_line_highlight=1
]])

if vim.env.DARK_THEME == "1" then
  vim.o.background = "dark"
  vim.cmd("colorscheme sonokai")
else
  vim.o.background = "light"
  vim.cmd('colorscheme catppuccin-latte')
end
