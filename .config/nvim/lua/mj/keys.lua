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
	["f"] =  f,
	["F"] = [[<Cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>]], -- Search Git Files
	["~"] = [[<Cmd>lua require("telescope.builtin").find_files({cwd="~"},{hidden=true},{no_ignore=true})<CR> ]], -- Search All files in $HOME
	["g"] = [[<Cmd>Telescope live_grep<CR>]], -- Grep Inside the Project
	["."] = [[<Cmd>Telescope grep_string<CR>]], -- Grep string where cursor
	[":"] = [[<Cmd>Telescope command_history<CR>]], -- Past Commands
	["b"] = [[<Cmd>Telescope buffers<CR>]], -- Opened Files
	["/"] = [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]], -- Search In this Files
	["r"] = [[<Cmd>Telescope registers<CR>]], -- Previously Pasted
	["S"] = [[<Cmd>Telescope treesitter<CR>]],
	-- Git:
	["c"] = [[<Cmd>Telescope git_commits<CR>]],
	["C"] = [[<Cmd>Telescope git_bcommits<CR>]],
	["B"] = [[<Cmd>Telescope git_branches<CR>]],
})

ap(l_vmap, {
	["leader"] = "<leader>f",
	["."] = [[<Cmd>Telescope grep_string<CR>]],
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
	["p"] = [[<Cmd>lua vim.lsp.buf.format()<CR><Cmd>w<CR>]], -- Prettier
	["d"] = [[<Cmd>Lspsaga show_line_diagnostics<CR>]], -- Show all diagnostics
	["a"] = [[<Cmd>Lspsaga code_action<CR>]],
	["f"] = [[<Cmd>Lspsaga lsp_finder<CR>]],
	["r"] = [[<Cmd>lua vim.lsp.buf.rename()<CR>]],
	["gr"] = [[<Cmd>Lspsaga rename ++project<CR>]],
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
	["go"] = [[<Cmd>lua vim.lsp.buf.definition()<CR>]],
	["gd"] = [[<Cmd>lua vim.lsp.buf.declaration()<CR>]],
	["gD"] = [[<Cmd>lua vim.lsp.buf.type_definition()<CR>]],
	["[e"] = prev,
	["]e"] = nex,
	["[d"] = [[<Cmd>Lspsaga	diagnostic_jump_prev<CR>]],
	["]d"] = [[<Cmd>Lspsaga	diagnostic_jump_next<CR>]],
	["[g"] = [[<Cmd>Gitsigns prev_hunk <CR>]],
	["]g"] = [[<Cmd>Gitsigns next_hunk <CR>]],
})

----------------
-- Buffers
----------------

-- BufferLine
for i = 1, 9, 1 do
	map("n", string.format("<Space>%s", i), function()
		ui.nav_file(i)
	end, default_opts)
end
map("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)", default_opts)

local function delOthers()
	local curr = vim.fn.bufnr("%")
	local bufs = vim.fn.getbufinfo()
	for _, value in pairs(bufs) do
		local bn = value["bufnr"]
		if bn ~= curr and vim.api.nvim_buf_is_loaded(bn) then
			local _, _ = pcall(vim.cmd, string.format("bd %d", bn))
		end
	end
end

-- Mini Buffer
ap(l_nmap, {
	["leader"] = "<leader>b",
	["d"] = [[<Cmd>bd<CR>]],
	["w"] = [[<Cmd>bw<CR>]],
	["D"] = delOthers,
	-- ["W"] = mj.delOthers,
})

-------------
-- Misc
-------------

ap(l_nmap, {
	["leader"] = "",
	["K"] = [[<Cmd>Lspsaga hover_doc<CR>]],
	["<C-A-z>"] = [[<Cmd>TZAtaraxis<CR>]],
	["<C-n>"] = mark.add_file,
	["<C-p>"] = ui.toggle_quick_menu,
})

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
