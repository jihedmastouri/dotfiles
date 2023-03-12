local lsp = require("lsp-zero").preset({
  name = "recommended",
  manage_nvim_cmp = false,
  sign_icons = { error = " ", warn = " ", hint = " ", info = " " }
})

lsp.ensure_installed({
  "tsserver",
  "rust_analyzer",
  "lua_ls",
  "gopls",
  "tailwindcss",
  "pyright",
  "hls",
  "cssls",
  "html"
})

lsp.configure("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

lsp.configure("gopls", {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  end,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

lsp.setup()


-- looking good like it should
-- local signs =
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
