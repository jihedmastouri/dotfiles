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

--------------------
-- SHORTCUT --
--------------------

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
	["B"] = [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]],
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
	["p"] = [[<Cmd>vim.lsp.buf.format()<CR> ]],
	["e"] = [[<Cmd>vim.lsp.diagnostic.show_line_diagnostics()<CR> ]],
	["a"] = [[<Cmd>Lspsaga code_action<CR>]],
	["f"] = [[<Cmd>Lspsaga lsp_finder<CR>]],
	["d"] = [[<Cmd>Lspsaga peek_definition<CR>]],
	["r"] = [[<cmd>lspsaga rename<cr>]],
	["o"] = [[<cmd>LSoutlineToggle<cr>]],
	["t"] = [[<cmd>TroubleToggle<cr>]],
})

-- Going Places
local nex = function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end
local prev = function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end
ap(l_nmap, {
	["leader"] = "",
	["go"] = [[<Cmd>lua vim.lsp.buf.definition()<CR>]],
	["gd"] = [[<Cmd>lua vim.lsp.buf.declaration()<CR>]],
	["gD"] = [[<Cmd>lua vim.lsp.buf.type_definition()<CR>]],
	["[e"] = prev(),
	["e]"] = nex(),
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

-- Mini Buffer
ap(l_nmap, {
	["leader"] = "<leader>b",
	["d"] = [[<Cmd>lua MiniBufremove.delete()<CR>]],
	["D"] = [[<Cmd>lua MiniBufremove.delete(0, true)<CR>]],
	["w"] = [[<Cmd>lua MiniBufremove.wipeout()<CR>]],
	["W"] = [[<Cmd>lua MiniBufremove.wipeout(0, true)<CR>]],
})

-------------
-- Misc
-------------

ap(l_nmap, {
	["leader"] = "",
	["K"] = [[<Cmd>Lspsaga hover_doc<CR>]],
	["<C-K>"] = [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]],
	["<C-A-z>"] = [[<Cmd>TZAtaraxis<CR>]],
	["S"] = [[<Cmd>call feedkeys("\\<Plug>(surround)")<CR>]],
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
