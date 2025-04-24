-- Paste AND Yank
vim.keymap.set("x", "<leader>p", '"0p', { noremap = true }) -- Paste from 0 register, after the cursor
vim.keymap.set("x", "<leader>P", '"0P', { noremap = true }) -- Paste from 0 register, before the cursor

vim.keymap.set("v", "P", '"_dp', { noremap = true }) -- Paste deleted text

vim.keymap.set("n", "yy", "^y$", { noremap = true }) -- line, without breakline
vim.keymap.set("n", "YY", "vapy", { noremap = true }) -- paragraph
vim.keymap.set("n", "Y", "y$", { noremap = true }) -- to line end

-- Yank to system clipboard
vim.keymap.set("x", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", '"+y$', { noremap = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true })
vim.keymap.set("n", "<leader>YY", 'vap"+y', { noremap = true })

-- Keeping it centered
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })
vim.keymap.set("n", "{", "{zz", { noremap = true })
vim.keymap.set("n", "}", "}zz", { noremap = true })
vim.keymap.set("n", "gg", "ggzz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true })
vim.keymap.set("n", "<c-d>", "<c-d>zz", { noremap = true })
vim.keymap.set("n", "<c-b>", "<c-b>zz", { noremap = true })

-- Miscellaneous
vim.keymap.set("n", "<S-u>", "<Nop>", { noremap = true }) -- Disable U
vim.keymap.set("n", "q:", "<Nop>", { noremap = true }) -- Disable miss clicks
vim.keymap.set("n", "Q", "gq", { noremap = true }) -- Badly align
vim.keymap.set("i", "jk", "<Esc>", { noremap = true }) -- Escape insert mode
vim.keymap.set("x", "x", '"_d', { noremap = true }) -- Delete without yanking
vim.keymap.set("x", "<tab>", ">gv", { noremap = true }) -- Indent right
vim.keymap.set("x", "<S-tab>", "<gv", { noremap = true }) -- Indent left

-- Folds
vim.keymap.set("i", "<F7>", "<C-O>za", { noremap = true }) 
vim.keymap.set("n", "<F7>", "za", { noremap = true })
vim.keymap.set("o", "<F7>", "<C-C>za", { noremap = true })
vim.keymap.set("v", "<F7>", "zf", { noremap = true }) -- Create fold

-- Don't consider } and { in jump history
vim.api.nvim_set_keymap(
	"n",
	"}",
	':<C-u>execute "keepjumps norm! " .. v:count1 .. "}"<CR>zz',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"{",
	':<C-u>execute "keepjumps norm! " .. v:count1 .. "{"<CR>zz',
	{ noremap = true, silent = true }
)

-- Insert mode break points
local break_points = { ",", ".", "!", "?", "<CR>" }
for _, char in ipairs(break_points) do
	local rhs = char
	if char == "<CR>" then
		rhs = "<CR><C-g>u"
	else
		rhs = char .. "<C-g>u"
	end
	vim.keymap.set("i", char, rhs, { silent = true })
end
