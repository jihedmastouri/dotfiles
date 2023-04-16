-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "rose-pine",
    section_separators = { left = "", right = "" },
    -- section_separators = { left = '', right = ''},
    component_separators = { left = "|", right = "|" },
    disabled_filetypes = { "packer", "NvimTree" },
    always_divide_middle = false,
  },
  sections = {
    lualine_a = { { "mode", separator = { right = "", left = "" } } },
    lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp" } } },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { { "location", separator = { right = "", left = "" } } },
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
