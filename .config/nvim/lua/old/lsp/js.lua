require('lspconfig').eslint.setup{
cmd = { "vscode-eslint-language-server", "--stdio" },
filetypes = { 
	"javascript", "javascriptreact", "javascript.jsx", "typescript", 
	"typescriptreact", "typescript.tsx", "vue" 
},
settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine"
    },
    showDocumentation = {
      enable = true
    }
  },
  codeActionOnSave = {
    enable = false,
    mode = "all"
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location"
  }
}
  } -- VS Code JS/TS Eslint Server
