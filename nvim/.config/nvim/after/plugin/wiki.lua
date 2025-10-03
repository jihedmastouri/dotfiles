-- wiki.lua - Simple wiki plugin for Neovim

-- Default paths
local wiki_root = "~/.wiki"
local wiki_index = wiki_root .. "/index.md"
local diary_root = wiki_root .. "/diary"
local diary_index = diary_root .. "/index.md"

-- Expand paths
local expanded_wiki_root = vim.fn.expand(wiki_root)
local expanded_diary_root = vim.fn.expand(diary_root)

-- open (and create) file
local function open_wiki_file(path)
	local expanded_path = vim.fn.expand(path)
	local dir = vim.fn.fnamemodify(expanded_path, ":h")

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	vim.cmd("edit " .. expanded_path)
end

-- telescop keymaps
function telescop_keymaps()
	local ok, telescope = pcall(require, "telescope.builtin")
	if not ok then
		vim.notify("Telescope not found. Install telescope.nvim for search features.", vim.log.levels.WARN)
		return
	end

	vim.keymap.set("n", "<leader>wf", function()
		telescope.find_files({
			prompt_title = "Wiki Files",
			cwd = expanded_wiki_root,
			find_command = { "find", expanded_diary_root, "-type", "f", "-name", "*.md" },
		})
	end, { desc = "[WIKI] Find wiki files" })

	vim.keymap.set("n", "<leader>wg", function()
		telescope.live_grep({ prompt_title = "Grep Wiki", cwd = expanded_wiki_root })
	end, { desc = " [WIKI] Grep wiki files" })

	vim.keymap.set("n", "<leader>wd", function()
		telescope.find_files({
			prompt_title = "Diary Entries",
			cwd = expanded_diary_root,
			find_command = { "find", expanded_diary_root, "-type", "f", "-name", "*.md" },
		})
	end, { desc = "[WIKI] Browse diary entries" })
end

-- Set up keymaps
function basic_keymaps()
	vim.keymap.set("n", "<leader>ww", function()
		open_wiki_file(wiki_index)
	end, { desc = "[WIKI] Open wiki index" })

	vim.keymap.set("n", "<leader>wi", function()
		open_wiki_file(diary_index)
	end, { desc = "[WIKI] Open wiki diary index" })
end

-- Setup function
function setup()
	basic_keymaps()
	telescop_keymaps()
end

-- setup()
