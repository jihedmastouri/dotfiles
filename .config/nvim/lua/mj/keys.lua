--------------------
-- INIT --
--------------------

local map = vim.keymap.set
local ap = table.insert

local l_nmap = {}
local l_xmap = {}
local l_vmap = {}

local default_opts = {
  noremap = true,
  silent = true,
  expr = false,
  nowait = false,
  script = false,
  unique = false,
}

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

----------------
-- Fuzzy Finder
----------------

-- Search files in This Dir
local function f()
  local isGit = vim.fn.system("git rev-parse --is-inside-work-tree 2> /dev/null")
  if isGit ~= "" then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end

ap(l_nmap, {
  ["leader"] = "<leader>f",
  ["f"] = f,                                                                                                   -- Search Git Files
  ["F"] = [[<Cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>]],                             -- Search All files in $HOME
  ["~"] = [[<Cmd>lua require("telescope.builtin").find_files({cwd="~"},{hidden=true},{no_ignore=true})<CR> ]], -- Grep Inside the Project
  ["g"] = [[<Cmd>Telescope live_grep<CR>]],
  -- Grep string where cursor
  ["."] = [[<Cmd>Telescope grep_string<CR>]],
  -- Past Commands
  [":"] = [[<Cmd>Telescope command_history<CR>]],
  -- Opened Files
  ["b"] = [[<Cmd>Telescope buffers<CR>]],
  -- Search In this Files
  ["/"] = [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]],
  -- Previously Pasted
  ["r"] = [[<Cmd>Telescope registers<CR>]],
  ["S"] = [[<Cmd>Telescope treesitter<CR>]],
  -- Git:
  ["c"] = [[<Cmd>Telescope git_commits<CR>]],
  ["C"] = [[<Cmd>Telescope git_bcommits<CR>]],
  ["B"] = [[<Cmd>Telescope git_branches<CR>]],
})

---------------
-- Explore
---------------
map("n", "<leader>\\", "<Cmd>NvimTreeFindFileToggle<CR>", default_opts)

ap(l_nmap, {
  ["leader"] = "<leader>e",
  ["/"] = [[<Cmd>NvimTreeToggle<CR> ]],
  ["u"] = [[<Cmd>UndotreeToggle<CR> <Cmd>UndotreeFocus<CR>]],
})

--------------
-- LSP
--------------

ap(l_nmap, {
  ["leader"] = "<leader>l",
  ["p"] = [[<Cmd>w<CR><Cmd>LspZeroFormat<CR><Cmd>w<CR>]], -- Formatter
  ["d"] = [[<Cmd>Lspsaga show_line_diagnostics<CR>]],     -- Show all diagnostics
  ["a"] = [[<Cmd>Lspsaga code_action<CR>]],
  ["f"] = [[<Cmd>Lspsaga lsp_finder<CR>]],
  ["r"] = [[<Cmd>Lspsaga rename ++project<CR>]],
  ["o"] = [[<Cmd>Lspsaga outline<CR>]],
  ["t"] = [[<Cmd>TroubleToggle<CR>]],
})

map("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", default_opts)

-- Going Places
local function nex()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end

local function prev()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end

ap(l_nmap, {
  ["leader"] = "",
  ["[e"] = prev,
  ["]e"] = nex,
  ["[g"] = [[<Cmd>Gitsigns prev_hunk <CR>]],
  ["]g"] = [[<Cmd>Gitsigns next_hunk <CR>]],
})

-------------
-- Misc
-------------

ap(l_nmap, {
  ["leader"] = "",
  ["<C-A-z>"] = [[<Cmd>TZAtaraxis<CR>]],
  ["<C-n>"] = mark.add_file,
  ["<C-p>"] = ui.toggle_quick_menu,
})
-- ["K"] = [[<Cmd>Lspsaga hover_doc<CR>]],

-- Harpoon
for i = 1, 9, 1 do
  map("n", string.format("<Space>%s", i), function()
    ui.nav_file(i)
  end, default_opts)
end
map("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)", default_opts)

--------------------
-- CONFIGS --
--------------------
local function map_leader_tree(tree, mode)
  for _, t in pairs(tree) do
    local prefix = t["leader"]
    for key, el in pairs(t) do
      if key ~= "leader" then
        map(mode, prefix .. key, el, default_opts)
      end
    end
  end
end

map_leader_tree(l_nmap, "n")
map_leader_tree(l_xmap, "x")
map_leader_tree(l_vmap, "v")
