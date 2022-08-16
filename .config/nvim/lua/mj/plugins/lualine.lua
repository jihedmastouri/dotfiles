-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
}


require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = bubbles_theme,
        section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '|', right = '|'},
        -- disabled_filetypes = {"coc-explorer"},
        always_divide_middle = false,
        },
    sections = {
        lualine_a = {{ 'mode', separator = { right = '', left = ''}}},
        lualine_b = {'branch', 'diff', {'diagnostics', sources={'coc'}}},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {{ 'location', separator = { right = '', left = ''}}},
        },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
        },
    tabline = {},
    extensions = {}
    }
