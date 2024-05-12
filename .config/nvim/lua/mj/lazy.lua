--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
--vim.g.have_nerd_font = true
--
--vim.opt.mouse = 'a'
--vim.opt.ignorecase = true
--vim.opt.smartcase = true
--vim.opt.signcolumn = 'yes'
--
--vim.opt.undofile = true
--vim.opt.updatetime = 250
--vim.opt.timeoutlen = 300
--
---- Enable break indent
--vim.opt.breakindent = true
--
---- Configure how new splits should be opened
--vim.opt.splitright = true
--vim.opt.splitbelow = true
--
---- Preview substitutions live, as you type!
--vim.opt.inccommand = 'split'
--
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "mj.plugs",
	change_detection = { notify = false },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
