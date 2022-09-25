-- keys.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Add Surroundings
map("v", "S", ':call feedkeys("\\<Plug>(surround)")<CR>', opts)

-- ZEN
map("n", "<C-A-z>", ':TZAtaraxis<CR>', opts)

-- -- Coc Navigation
-- map("n", "go", "<Plug>(coc-definition)" ,opts)
-- map("n", "gr", "<Plug>(coc-references)" ,opts)
-- map("n", "gi", "<Plug>(coc-implementation)" ,opts)
-- map("n", "K", ":call CocActionAsync('doHover')<cr>" ,opts)
-- map("n", "g[", "<Plug>(coc-diagnostic-prev)" ,opts)
-- map("n", "g]", "<Plug>(coc-diagnostic-next)" ,opts)
-- map("n", "<leader>o", ":<C-u>CocList diagnostics<CR>" ,opts)

-- -- Coc Features
-- map("v", "<leader>f", "<Plug>(coc-format-selected)" ,opts)
-- map("n", "<leader>f", "<Plug>(coc-format)" ,opts)
-- map("v", "<leader>a", "<Plug>(coc-codeaction-selected)" ,opts)
-- map("n", "<leader>a", "<Plug>(coc-codeaction)" ,opts)
-- map("n", "<leader>cl", "<Plug>(coc-codelens-action)" ,opts)

-- LSP
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
map("n", "<space>s", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
map("n", "<space>o", "<cmd>Trouble<CR>", opts)

-- Telescope
map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>', opts)
map("n", "<leader>f~", '<cmd>lua require("telescope.builtin").find_files({cwd="~"},{},{hidden=true})<CR>', opts)
map("n", "<leader>f.", '<cmd>lua require("telescope.builtin").find_files({cwd ="%:h"},{},{hidden=true})<CR>', opts)
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map("n", "<leader>fB", '<cmd>lua require("telescope.builtin").buffers({cwd = "%:h"})<CR>', opts)
map("n", "<leader>fb", "<cmd>:Telescope file_browser<CR>", opts)
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags({cwd = "%:h"})<CR>', opts)
map("n", "<leader>fG", '<cmd>lua require("telescope.builtin").git_branches()<CR>', opts)
map("n", "<leader>ft", '<cmd>lua require("telescope.builtin").treesitter()<CR>', opts)
map("n", "<leader>fr", '<cmd>lua require("telescope.builtin").registers()<CR>', opts)

-- BufferLine
map("n", "<leader>1", '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', opts)
map("n", "<leader>2", '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', opts)
map("n", "<leader>3", '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', opts)
map("n", "<leader>4", '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', opts)
map("n", "<leader>5", '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>', opts)
map("n", "<leader>6", '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', opts)
map("n", "<leader>7", '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', opts)
map("n", "<leader>8", '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', opts)
map("n", "<leader>9", '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', opts)
map("n", "<leader>$", '<cmd>lua require("bufferline").go_to_buffer(-1, true)<cr>', opts)

-- TREEs
map("n", "<leader>\\", ":NvimTreeFindFileToggle<CR>", opts)
map("n", "<leader>/", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- GIT Actions

-- GitSigns
map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)
-- map("x", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
-- map("x", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
-- map("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", opts)
-- map("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", opts)
-- map("n", "<leader>hR", ":Gitsigns redo_buffer", opts)
-- map("n", "<leader>hd", ":Gitsigns diffthis<CR>", opts)
-- map("n", "<leader>hD", ":Gitsigns diffthis ~<CR>", opts)
-- map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", opts)
-- map("", "<leader>ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
