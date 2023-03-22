----------------------
-- Better GUI --
----------------------
require("lspsaga").setup({
  beacon = {
    enable = true,
    frequency = 7,
  },
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    enable_in_insert = false,
    virtual_text = false,
  },
  diagnostic = {
    on_insert = false,
  },
  ui = {
    -- Currently, only the round theme exists
    theme = "round",
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "rounded",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡",
    diagnostic = "🐞",
    incoming = " ",
    outgoing = " ",
    hover = " ",
  },
})
