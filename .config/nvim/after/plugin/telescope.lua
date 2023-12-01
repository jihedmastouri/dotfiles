local telescope = require("telescope")
local builtins = require("telescope.builtin")
local configs = require("telescope.config")
local is_inside_work_tree = {}
local ignore_list = {
  -- Media and other no terminal
  "%.avi$",
  "%.gif$",
  "%.jpeg$",
  "%.jpg$",
  "%.mkv$",
  "%.mp3$",
  "%.mp4$",
  "%.png$",
  "%.svg$",
  "%.webp$",
  "%.csv$",
  "%.woff$",
  -- Build
  "bin/",
  "build/",
  "dist/",
  "target/",
  "webpack/",
  "wp%-deps",
  -- Binary
  "%.class$",
  "%.dll$",
  "%.exe$",
  "%.o$",
  "%.out$",
  -- Package Manager
  "node_modules/",
  "package-lock%.json$",
  "pnpm-lock%.yaml$",
  "yarn-lock%.json$",
  "venv/",
  "%.cargo/",
  "Cargo.lock$",
  "%.rustfmt.toml$",
  "%.rustup/",
  -- IDE
  "%.DS_Store/",
  "%.cache/",
  "%.idea/",
  "%.vscode/",
  -- git
  "%.git/",
  "%.gitkeep",
  "%.gitmodules/",
  -- Misc
  "migrations/",
  "%.sqlite",
  "%.db$",
}

local grep_args = { unpack(configs.values.vimgrep_arguments) }
table.insert(grep_args, "--max-columns=1000")
table.insert(grep_args, "--max-filesize=1M")

telescope.setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    generic_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = ignore_list,
    vimgrep_arguments = grep_args,
  },
	mappings = {
		n = {
				-- TODO: Fix Mapping
				['o'] = "confirm"
		}
	}
})

-- Open Telescope if It's a dir
vim.api.nvim_create_augroup("TelescopeDir", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	group = "TelescopeDir",
	callback = function()
		local last_arg = vim.v.argv[#vim.v.argv]
		if last_arg and vim.fn.isdirectory(last_arg) == 1 then
			require("telescope.builtin").find_files()
		end
	end,
})


-- keybindings:

local find = function()
  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtins.git_files()
  else
    builtins.find_files()
  end
end

-- Files
keymap("n", "<C-p>", find)
-- Grep
keymap("n", "<C-h>", [[<Cmd>Telescope live_grep<CR>]])

-- All file no ignore
keymap(
  "n",
  "<leader>ff",
  [[<Cmd>lua require("telescope.builtin").find_files({hidden=true,no_ignore=true})<CR>]]
)

-- Buffers
keymap("n", "<leader>fb", [[<Cmd>Telescope buffers<CR>]])
keymap("n", "<leader>f/", [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]])

-- MISC
keymap("n", "<leader>fs", [[<Cmd>Telescope treesitter<CR>]])
keymap("n", "<leader>f:", [[<Cmd>Telescope command_history<CR>]])
keymap("n", "<leader>fr", [[<Cmd>Telescope registers<CR>]])
keymap("n", "<leader>fd", [[<Cmd>Telescope diagnostics<CR>]])
