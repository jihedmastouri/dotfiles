--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- nnoremap e viw
-- nnoremap E viW
-- map Q gq " Don't use Ex mode, use Q for formatting.

-- Window Nagigation
map('n','H',"<C-w>h",opts)
map('n','L',"<C-w>l",opts)
map('n','<C-s>',"<C-w>v",opts)

-- Paste Yanked
map('n','<space>p',"\"0p",opts)
map('n','<space>P',"\"0P",opts)

-- Normal X Virtual Modes
map('x','<Tab>',">gv",opts)
map('x','<S-Tab>',"<gv",opts)
map('x','x',"\"_x",opts)

-- Insert Mode
map('i','jk', "<ESC>", opts)

-- Moving Fast! (with alt)
map('n','<A-j>', ":m .+1<CR>==", opts)
map('n','<A-k>', "::m .-2<CR>==", opts)
map('i','<A-j>', ":<Esc>:m .+1<CR>==gi", opts)
map('i','<A-k>', ":<Esc>:m .-2<CR>==gi", opts)
map('v','<A-j>', "::m '>+1<CR>gv=gv", opts)
map('v','<A-k>', "::m '<-2<CR>gv=gv", opts)

-- Telescope
map('n', '<space>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<space>.', '<cmd>lua require("telescope.builtin").find_files({cwd="~"},{},{hidden=true})<CR>', opts)
map('n', '<space>,', '<cmd>lua require("telescope.builtin").find_files({cwd = "%:h"},{},{hidden=true})<CR>', opts)
map('n', '<space>fg', '<cmd>lua require("telescope.builtin").live_grep({cwd = "%:h"})<CR>', opts)
map('n', '<space>fb', '<cmd>lua require("telescope.builtin").buffers({cwd = "%:h"})<CR>', opts)
map('n', '<space>fh', '<cmd>lua require("telescope.builtin").help_tags({cwd = "%:h"})<CR>', opts)

-- NERD TREE
map('n', '<space>/', '<cmd>NERDTreeToggle<CR>', opts)
map('n', '<space>\\', '<cmd>NERDTreeFind<CR>', opts)
