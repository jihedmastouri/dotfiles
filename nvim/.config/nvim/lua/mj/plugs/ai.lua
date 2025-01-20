return {
	-- "github/copilot.vim",
    {
        "frankroeder/parrot.nvim",
        dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
        opts = { },
        config = function()
            require("parrot").setup {
              -- Providers must be explicitly added to make them available.
              providers = {
                anthropic = {
                  api_key = os.getenv "ANTHROPIC_API_KEY",
                },
              },
            }
          end,

    }

}
