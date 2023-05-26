-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "rose-pine",
    component_separators = { left = "|", right = "|" },
    section_separators = { },
    disabled_filetypes = { "packer", "NvimTree", "which-key" },
  },
  sections = {
    lualine_a = {  "mode"  },
    lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp" } } },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_y = { },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
