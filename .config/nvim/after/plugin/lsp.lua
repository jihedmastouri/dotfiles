local lsp = require("lsp-zero").preset("recommended")

lsp.set_sign_icons({
  error = diag_icons.error,
  warn = diag_icons.warning,
  hint = diag_icons.hint,
  info = diag_icons.info,
})

lsp.ensure_installed({
  "tsserver",
  "rust_analyzer",
  "lua_ls",
  "gopls",
  "tailwindcss",
  "pyright",
  "cssls",
  "html",
  "eslint",
  "astro"
})

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		style = 'minimal',
		border = 'rounded',
		source = 'always',
	},
})

-------------------
-- Cmp
-------------------
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = require("lspkind").cmp_format({
      mode = "symbol",       -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand() then
        luasnip.expand()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
})

-------------------
-- KeyMaps
-------------------

-- Formatting:
keymap("n", "gp", "<CMD>Neoformat<CR>")

-- Show Actions
keymap("n", "ga", function()
  vim.lsp.buf.code_action({ floating_window = true })
end)

-- Show function signature
keymap("i", "<C-k>", vim.lsp.buf.signature_help)

-- Go to diagnostic
local function nex()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end
local function prev()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end

-- Go to error
keymap("n", "[e", nex)
keymap("n", "]e", prev)
