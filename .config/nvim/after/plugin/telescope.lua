local telescope = require("telescope")

telescope.setup({
  extensions = {
    -- file_browser = {
    -- 	theme = "ivy",
    -- 	hijack_netrw = true,
    -- },
  },
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    generic_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = { "png", "jpeg", "svg", "jpg" },
  },
  -- pickers = {
  -- 	find_files = {},
  -- },
})

-- Search files in This Dir
local function f()
  local isGit = vim.fn.system("git rev-parse --is-inside-work-tree 2> /dev/null")
  if isGit ~= "" then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end

-- keybindings:
-- Files
map("n", "<leader>ff", f, default_opts)
map("n", "<leader>fF",
  [[<Cmd>lua require("telescope.builtin").find_files({hidden=true},{no_ignore=true})<CR>]],
  default_opts
)
map("n", "<leader>fb", [[<Cmd>Telescope buffers<CR>]], default_opts)
-- Grep
map("n", "<leader>fg", [[<Cmd>Telescope live_grep<CR>]], default_opts)
map("n", "<leader>f/", [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]], default_opts)
-- Git:
map("n", "<leader>fc", [[<Cmd>Telescope git_commits<CR>]], default_opts)
map("n", "<leader>fC", [[<Cmd>Telescope git_bcommits<CR>]], default_opts)
map("n", "<leader>fB", [[<Cmd>Telescope git_branches<CR>]], default_opts)
-- MISC
map("n", "<leader>fS", [[<Cmd>Telescope treesitter<CR>]], default_opts)
map("n", "<leader>f:", [[<Cmd>Telescope command_history<CR>]], default_opts)
map("n", "<leader>fr", [[<Cmd>Telescope registers<CR>]], default_opts)
