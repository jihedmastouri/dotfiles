local telescope = require("telescope")
local builtins = require("telescope.builtin")
local configs = require("telescope.config")
local is_inside_work_tree = {}
local ignore_list = {
  -- Media and other no terminal
  "%.avi",
  "%.gif",
  "%.jpeg",
  "%.jpg",
  "%.mkv",
  "%.mp3",
  "%.mp4",
  "%.png",
  "%.svg",
  "%.webp",
  "%.csv",
  "%.woff",
  -- Build
  "bin/",
  "build/",
  "dist/",
  "target/",
  "webpack/",
  "wp%-deps",
  -- Binary
  "%.class",
  "%.dll",
  "%.exe",
  "%.o",
  "%.out",
  -- Package Manager
  "node_modules/",
  "package-lock",
  "-lock",
  "pnpm-lock",
  "yarn-lock",
  "venv/",
  "%.cargo/",
  "Cargo.lock",
  "%.rustfmt.toml",
  "%.rustup/",
  -- IDE
  "%.DS_Store",
  "%.cache",
  "%.idea",
  "%.vscode",
  -- git
  "%.git/",
  "%.gitkeep",
  "%.gitmodules/",
  -- Misc
  "migrations",
  "%.sqlite",
}

local grep_args = { unpack(configs.values.vimgrep_arguments) }
table.insert(grep_args, "--max-columns=1000")
table.insert(grep_args, "--max-filesize=1M")

telescope.setup({
  extensions = {
    -- file_browser = {
    -- theme = "ivy",
    -- hijack_netrw = true,
    -- },
  },
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    generic_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = ignore_list,
    vimgrep_arguments = grep_args,
  },
  -- pickers = {
  --   find_files = {},
  -- },
})

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

-- keybindings:
-- Files
map("n", "<C-p>", find, default_opts)
-- Grep
map("n", "<C-h>", [[<Cmd>Telescope live_grep<CR>]], default_opts)
-- All file no ignore
map(
  "n",
  "<leader>ff",
  [[<Cmd>lua require("telescope.builtin").find_files({hidden=true,no_ignore=true})<CR>]],
  default_opts
)
-- Buffers
map("n", "<leader>fb", [[<Cmd>Telescope buffers<CR>]], default_opts)
map("n", "<leader>f/", [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]], default_opts)
-- Git:
map("n", "<leader>fc", [[<Cmd>Telescope git_commits<CR>]], default_opts)
map("n", "<leader>fC", [[<Cmd>Telescope git_bcommits<CR>]], default_opts)
map("n", "<leader>fB", [[<Cmd>Telescope git_branches<CR>]], default_opts)
-- MISC
map("n", "<leader>fs", [[<Cmd>Telescope treesitter<CR>]], default_opts)
map("n", "<leader>f:", [[<Cmd>Telescope command_history<CR>]], default_opts)
map("n", "<leader>fr", [[<Cmd>Telescope registers<CR>]], default_opts)
map("n", "<leader>fd", [[<Cmd>Telescope diagnostics<CR>]], default_opts)
