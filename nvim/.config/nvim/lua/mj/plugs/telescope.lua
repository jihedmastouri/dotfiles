return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	opts = {
		--file_sorter = require("telescope.sorters").get_fzy_sorter,
		--generic_sorter = require("telescope.sorters").get_fzy_sorter,
		-- file_ignore_patterns = ignore_list,
		--vimgrep_arguments = grep_args,
		--buffer_previewer_maker = new_maker,
	},
	config = function()

		local actions = require("telescope.actions")
		local configs = require("telescope.config")
		local previewers = require("telescope.previewers")
		local builtins = require("telescope.builtin")
		local sorters = require("telescope.sorters")

		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			defaults = {
				mappings = {
					i = {
						["<M-q>"] = actions.send_to_qflist + actions.open_qflist
					},
					n = {
						["<M-q>"] = actions.send_to_qflist + actions.open_qflist
					},
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")


		local hide_pattern = { "%.env" }
		local bad_files = function(filepath)
			for _, v in ipairs(hide_pattern) do
				if not filepath:match(v) then
					return false
				end
			end
			return true
		end
		local new_maker = function(filepath, bufnr, opts)
			opts = opts or {}
			if not bad_files(filepath) then
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			end
		end

		local grep_args = { unpack(configs.values.vimgrep_arguments) }
		table.insert(grep_args, "--max-columns=1000")
		table.insert(grep_args, "--max-filesize=1M")
		table.insert(grep_args, "--hidden")

		configs.values.file_ignore_patterns = {}
		configs.values.vimgrep_arguments = grep_args
		configs.values.buffer_previewer_maker = new_maker
		configs.values.file_sorter = sorters.get_fzy_sorter
		configs.values.generic_sorter = sorters.get_fzy_sorter

		-- Open Telescope if It's a dir
		vim.api.nvim_create_augroup("TelescopeDir", { clear = true })
		vim.api.nvim_create_autocmd("VimEnter", {
			group = "TelescopeDir",
			callback = function()
				local last_arg = vim.v.argv[#vim.v.argv]
				if last_arg and vim.fn.isdirectory(last_arg) == 1 then
					builtins.find_files({ hidden = true })
				end
			end,
		})

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
		end

		-- Files
		map("<C-p>", function()
			builtins.find_files({ hidden = true })
		end, "Find Project Files")
		map("<leader>ff", function()
			builtins.find_files({ hidden = true, no_ignore = true })
		end, "[F]ind All [F]iles") -- All file no ignore

		-- Strings Lookup
		map("<C-h>", builtins.live_grep, "Search in All Files")
		map("<leader>f/", builtins.current_buffer_fuzzy_find, "Search in File")

		-- Buffers
		map("<leader>fb", builtins.buffers, "Opened [B]uffers")

		-- MISC
		map("<leader>fs", builtins.lsp_document_symbols, "Document [S]ymbols")
		map("<leader>fw", builtins.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>fa", builtins.git_files, "Find Tracked Git Files")
		map("<leader>fG", builtins.git_status, "[G]it Status")
		map("<leader>f:", builtins.command_history, "Command History")
		map("<leader>fr", builtins.registers, "[R]egisters")
		map("<leader>fd", function()
			builtins.diagnostics({ severity_bound = 0 })
		end, "Project [D]iagnostics")
	end,
}
