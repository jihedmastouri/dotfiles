--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- NAVIGATION
-- noremap <leader>p \"0p
-- noremap <leader>P \"0P
-- map <leader>a ggVG
-- 
-- nnoremap e viw
-- nnoremap E viW
-- map Q gq " Don't use Ex mode, use Q for formatting.
-- 
-- xnoremap <tab> >gv
-- xnoremap x \"_x
-- xnoremap <S-tab> <gv
-- 
map('n','jk', "<ESC>", opts)


map('n','<A-j>', ":m .+1<CR>==", opts)
map('n','<A-k>', "::m .-2<CR>==", opts)
map('i','<A-j>', ":<Esc>:m .+1<CR>==gi", opts)
map('i','<A-k>', ":<Esc>:m .-2<CR>==gi", opts)
map('v','<A-j>', "::m '>+1<CR>gv=gv", opts)
map('v','<A-k>', "::m '<-2<CR>gv=gv", opts)

-- Telescope
map('n', '<Space>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<Space>,', '<cmd>lua require("telescope.builtin").find_files({cwd = "%:h"})<CR>', opts)
map('n', '<Space>fg', '<cmd>lua require("telescope.builtin").live_grep({cwd = "%:h"})<CR>', opts)
map('n', '<Space>fb', '<cmd>lua require("telescope.builtin").buffers({cwd = "%:h"})<CR>', opts)
map('n', '<Space>fh', '<cmd>lua require("telescope.builtin").help_tags({cwd = "%:h"})<CR>', opts)

-- NERD TREE
map('n', '<Space>/', '<cmd>NERDTreeToggle<CR>', opts)
map('n', '<Space>.', '<cmd>NERDTreeFind<CR>', opts)
