--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = " " -- allows to make more extensive keybinds
vim.g.maplocalleader = " " -- with <leader> eg. 'map <leader>n :new<cr>'

-- nnoremap e viw
-- nnoremap E viW
-- map Q gq " Don't use Ex mode, use Q for formatting.

-- Plugs
map("n", "<leader><space>", ':call feedkeys("\\<Plug>(easymotion)")<CR>', opts)
map("n", "S", ':call feedkeys("\\<Plug>(surround)")<CR>', opts)

-- Window Nagigation
map('n','H',"<C-w>h",opts)
map('n','L',"<C-w>l",opts)
map('n','<C-s>',"<C-w>v",opts)

-- Paste Yanked
map('n','<leader>p',"\"0p",opts)
map('n','<leader>P',"\"0P",opts)

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
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<leader>.', '<cmd>lua require("telescope.builtin").find_files({cwd="~"},{},{hidden=true})<CR>', opts)
map('n', '<leader>,', '<cmd>lua require("telescope.builtin").find_files({cwd = "%:h"},{},{hidden=true})<CR>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep({cwd = "%:h"})<CR>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers({cwd = "%:h"})<CR>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags({cwd = "%:h"})<CR>', opts)

-- NERD TREE
map('n', '<leader>/', '<cmd>NERDTreeToggle<CR>', opts)
map('n', '<leader>\\', '<cmd>NERDTreeFind<CR>', opts)
