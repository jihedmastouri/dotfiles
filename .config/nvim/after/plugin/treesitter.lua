require "nvim-treesitter.configs".setup {
  ensure_installed = { "lua", "javascript", "typescript" ,"python", "go",
		"sql", "bash", "html", "css", "tsx", "haskell", "vim", "json",
		"regex", "vue", "dockerfile", "markdown"
	},
  sync_install = false,
  auto_install = true,
  tree_docs = {
    enable = true,
    spec_config = {
      jsdoc = {
        slots = {
          class = {author = true}
        },
        processors = {
          author = function()
            return " * @author Steven Sojka"
          end
        }
      }
    }
  }
}
