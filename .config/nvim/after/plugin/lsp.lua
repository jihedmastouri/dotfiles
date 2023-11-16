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

-- lsp.configure("gopls", {
--   cmd = { "gopls", "serve" },
--   filetypes = { "go", "gomod", "gosum", "gowork" },
-- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
-- on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- end,
-- settings = {
--   gopls = {
--     analyses = {
--       unusedparams = true,
--     },
--     staticcheck = true,
--   },
-- },
-- })

-- lsp.configure("tsserver", {
  -- filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  -- cmd = { "typescript-language-server", "--stdio" },
  -- on_attach = function(client)
  --   client.server_capabilities.documentFormattingProvider = false
  -- end,
  -- settings = {
  --   completions = {
  --     completeFunctionCalls = true,
  --   },
  -- },
-- })

lsp.nvim_workspace()
lsp.setup()

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

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		style = 'minimal',
		border = 'rounded',
		source = 'always',
		-- header = '',
		-- prefix = '',
	},
})

-------------------
-- KeyMaps
-------------------

-- leader key:
map("n", "gp", "<CMD>Neoformat<CR>", default_opts)
map("n", "ga", function()
  vim.lsp.buf.code_action({ floating_window = true })
end, default_opts)

map("i", "<C-k>", vim.lsp.buf.signature_help, default_opts)

-- Going Places
local function nex()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end
local function prev()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end

map("n", "[e", nex, default_opts)
map("n", "]e", prev, default_opts)
