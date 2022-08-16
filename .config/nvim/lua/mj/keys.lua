-- keys.lua
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Add Surroundings
map("v", "S", ':call feedkeys("\\<Plug>(surround)")<CR>', opts)

-- Vimspector Debuging
map("n", "<leader>vl", ":call vimspector#Launch()<CR>", opts)
map("n", "<leader>vr",  ":VimspectorReset<CR>", opts)
map("n", "<leader>ve",  ":VimspectorEval", opts)
map("n", "<leader>vw",  ":VimspectorWatch", opts)
map("n", "<leader>vo",  ":VimspectorShowOutput", opts)
map("n", "<leader>vi",  "<Plug>VimspectorBalloonEval", opts)
map("x", "<leader>vi",  "<Plug>VimspectorBalloonEval", opts)

-- Coc Navigation
map("n", "go", "<Plug>(coc-definition)" ,opts)
map("n", "gr", "<Plug>(coc-references)" ,opts)
map("n", "gi", "<Plug>(coc-implementation)" ,opts)
map("n", "K", ":call CocActionAsync('doHover')<cr>" ,opts)
map("n", "g[", "<Plug>(coc-diagnostic-prev)" ,opts)
map("n", "g]", "<Plug>(coc-diagnostic-next)" ,opts)
map("n", "<leader>o", ":<C-u>CocList diagnostics<CR>" ,opts)

-- Coc Features
map("x", "<leader>f", "<Plug>(coc-format-selected)" ,opts)
map("x", "<leader>a", "<Plug>(coc-codeaction-selected)" ,opts)
map("n", "<leader>cl", "<Plug>(coc-codelens-action)" ,opts)

-- CoC Tab to select
vim.cmd [[
	inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
]]

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>', opts)
map('n', '<leader>f~', '<cmd>lua require("telescope.builtin").find_files({cwd="~"},{},{hidden=true})<CR>', opts)
map('n', '<leader>f.', '<cmd>lua require("telescope.builtin").find_files({cwd ="%:h"},{},{hidden=true})<CR>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers({cwd = "%:h"})<CR>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags({cwd = "%:h"})<CR>', opts)
map('n', '<leader>fG', '<cmd>lua require("telescope.builtin").git_branches()<CR>', opts)
map('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<CR>', opts)
map('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<CR>', opts)

-- BufferLine
map('n', '<leader>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', opts)
map('n', '<leader>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', opts)
map('n', '<leader>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', opts)
map('n', '<leader>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', opts)
map('n', '<leader>5', '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>', opts)
map('n', '<leader>6', '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', opts)
map('n', '<leader>7', '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', opts)
map('n', '<leader>8', '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', opts)
map('n', '<leader>9', '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', opts)
map('n', '<leader>$', '<cmd>lua require("bufferline").go_to_buffer(-1, true)<cr>', opts)

-- TREEs
map('n', '<leader>\\', ':NvimTreeFindFileToggle<CR>', opts)
map('n', '<leader>/', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)

-- GIT Actions
map('x', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
map('x', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>hS', ':Gitsigns stage_buffer<CR>', opts)
map('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>',opts)
map('n', '<leader>hR', ':Gitsigns redo_buffer', opts)
map('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>hd', ':Gitsigns diffthis<CR>', opts)
map('n', '<leader>hD', ':Gitsigns diffthis ~<CR>', opts)
map('n', '<leader>td', ':Gitsigns toggle_deleted<CR>', opts)

-- GIT Navigation
-- map('n', ']c', function()
-- 	local gs = package.loaded.gitsigns
-- 	if vim.wo.diff then return ']c' end
-- 	vim.schedule(function() gs.next_hunk() end)
-- 	return '<Ignore>'
-- end, {expr=true, silent=true, noremap=true})

-- map('n', '[c', function()
-- 	local gs = package.loaded.gitsigns
-- 	if vim.wo.diff then return '[c' end
-- 	vim.schedule(function() gs.prev_hunk() end)
-- 	return '<Ignore>'
-- end, {expr=true, silent=true, noremap=true})

-- GIT Text Object
map('', '<leader>ih', ':<C-U>Gitsigns select_hunk<CR>', opts)


-- Zen Mode
map('n', '<C-M-z>', ':TZAtaraxis<CR>', opts)
