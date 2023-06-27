-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "packer", "NvimTree", "which-key" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {},
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp" } } },
    lualine_y = { "filetype" },
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
