if vim.env.DARK_THEME == "1" then
  vim.o.background = "dark"
else
  vim.o.background = "light"
end

require("tokyonight").setup({
  style = "moon",     -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = { italic = true },
    variables = {},
    sidebars = "transparent",                        -- style for sidebars, see below
    floats = "transparent",                          -- style for floating windows
  },
  sidebars = { "qf", "help", "whichkey", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  hide_inactive_statusline = false,                  -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
})

require("catppuccin").setup({
  transparent_background = false,
  no_italic = false, -- Force no italic
  no_bold = false,   -- Force no bold
  show_end_of_buffer = false,
  styles = {
    comments = { "italic" },
    conditionals = { "bold" },
    functions = { "bold" },
    strings = { "italic" },
    types = { "bold" },
    operators = { "bold" },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    harpoon = true,
    lsp_saga = true,
    lsp_trouble = true,
    mason = true,
    nvimtree = true,
    telescope = true,
    treesitter_context = true,
    treesitter = true,
    which_key = true,
    -- Special
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})

if vim.env.DARK_THEME == "1" then
  vim.cmd("colorscheme tokyonight")
else
  vim.cmd("colorscheme catppuccin-latte")
end
