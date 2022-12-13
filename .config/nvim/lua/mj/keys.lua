--------------------
-- INIT --
--------------------

local map = vim.api.nvim_set_keymap
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

----------------
-- Fuzzy Finder
----------------

ap(l_nmap, {
	["leader"] = "<leader>f",
	["f"] = [[<Cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>]],
	["~"] = [[<Cmd>lua require("telescope.builtin").find_files({cwd="~"},{},{hidden=true})<CR> ]],
	["g"] = [[<Cmd>Telescope live_grep<CR>]],
	["."] = [[<Cmd>Telescope grep_string<CR>]],
	[":"] = [[<Cmd>Telescope command_history<CR>]],
	["b"] = [[<Cmd>Telescope buffers<CR>]],
	["/"] = [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]],
	["c"] = [[<Cmd>Telescope git_commits<CR>]],
	["C"] = [[<Cmd>Telescope git_bcommits<CR>]],
	["G"] = [[<Cmd>Telescope git_branches<CR>]],
	["r"] = [[<Cmd>Telescope registers<CR>]],
	["S"] = [[<Cmd>Telescope treesitter<CR>]],
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
	["o"] = [[<Cmd>LSoutlineToggle<CR>]],
	["t"] = [[<Cmd>TroubleToggle<CR>]],
})

map("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", default_opts)

-- Going Places
function mj.nex()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end

function mj.prev()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end

ap(l_nmap, {
	["leader"] = "",
	["go"] = [[<Cmd>lua vim.lsp.buf.definition()<CR>]],
	["gd"] = [[<Cmd>lua vim.lsp.buf.declaration()<CR>]],
	["gD"] = [[<Cmd>lua vim.lsp.buf.type_definition()<CR>]],
	["[e"] = [[<Cmd>lua mj.prev()<CR>]],
	["]e"] = [[<Cmd>lua mj.nex()<CR>]],
})

----------------
-- Buffers
----------------

-- BufferLine
for i = 1, 9, 1 do
	map(
		"n",
		string.format("<Space>%s", i),
		string.format("<cmd>lua require('bufferline').go_to_buffer(%s, true)<CR>", i),
		default_opts
	)
end
map("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)", default_opts)

function mj.delOthers()
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
	["D"] = [[<cmd>lua mj.delothers()<cr>]],
	-- ["W"] = mj.delOthers,
})

-------------
-- Misc
-------------

ap(l_nmap, {
	["leader"] = "",
	["K"] = [[<Cmd>Lspsaga hover_doc<CR>]],
	["<C-A-z>"] = [[<Cmd>TZAtaraxis<CR>]],
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
