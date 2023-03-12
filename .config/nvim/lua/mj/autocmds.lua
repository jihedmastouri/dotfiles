-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = packer_group,
	pattern = "~/.config/nvim/init.lua",
	callback = function()
		vim.fn.source("%")
		vim.cmd("PackerCompile")
	end,
})

-- [[ On Vim Enter ]]
-- Set working Dir
local open_group = vim.api.nvim_create_augroup("Welcome", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
	end,
	pattern = "*",
	group = open_group,
})

-- Open Telescope if It's a dir
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local last_arg = vim.v.argv[#vim.v.argv]
		if last_arg and vim.fn.isdirectory(last_arg) == 1 then
			require("telescope.builtin").find_files()
		end
	end,
	group = open_group,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = open_group,
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.fn.setpos(".", vim.fn.getpos("'\""))
			vim.cmd("normal zz")
			vim.cmd("silent! foldopen")
		end
	end,
})

-- [[ File Type ]]
-- Mj.files_group = vim.api.nvim_create_augroup("Files", { clear = true })

-- Enable spell checking for certain file types
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
-- 	pattern = { "*.txt", "*.md", "*.tex" },
-- 	command = "setlocal spell",
-- 	group = Mj.files_group,
-- })
