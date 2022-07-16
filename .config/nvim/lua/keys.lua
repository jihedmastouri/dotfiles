--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Plugs
map("n", "<leader><space>", ':call feedkeys("\\<Plug>(easymotion)")<CR>', opts)
map("n", "S", ':call feedkeys("\\<Plug>(surround)")<CR>', opts)
map("n", "S", ':call feedkeys("\\<Plug>(sneak)")<CR>', opts)

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
map("n", "gj", "<Plug>(coc-implementation)" ,opts)
map("n", "K", ":call CocActionAsync('doHover')<cr>" ,opts)
map("n", "g[", "<Plug>(coc-diagnostic-prev)" ,opts)
map("n", "g]", "<Plug>(coc-diagnostic-next)" ,opts)
map("n", "<leader>o", ":<C-u>CocList diagnostics<CR>" ,opts)

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<leader>.', '<cmd>lua require("telescope.builtin").find_files({cwd="~"},{},{hidden=true})<CR>', opts)
map('n', '<leader>,', '<cmd>lua require("telescope.builtin").find_files({cwd = "%:h"},{},{hidden=true})<CR>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep({cwd = "%:h"})<CR>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers({cwd = "%:h"})<CR>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags({cwd = "%:h"})<CR>', opts)
map('n', '<leader>fG', '<cmd>lua require("telescope.builtin").git_branches()<CR>', opts)
map('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<CR>', opts)
map('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<CR>', opts)

-- NERD TREE
map('n', '<leader>/', '<cmd>NERDTreeToggle<CR>', opts)
map('n', '<leader>\\', '<cmd>NERDTreeFind<CR>', opts)
-- NerdTree leader m => menu
