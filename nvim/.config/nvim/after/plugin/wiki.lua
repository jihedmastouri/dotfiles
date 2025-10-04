-- wiki.lua - Simple wiki plugin for Neovim

-- Default paths
local wiki_root = "~/.wiki"
local wiki_index = wiki_root .. "/index.md"
local diary_root = wiki_root .. "/diary"
local diary_index = diary_root .. "/index.md"

-- Expand paths
local expanded_wiki_root = vim.fn.expand(wiki_root)
local expanded_diary_root = vim.fn.expand(diary_root)

-- Last buffer before opening diary
local last_buffer

local function udpdate_last_buffer()
	local current_file = vim.fn.expand("%:p")
	if not (current_file:find(expanded_wiki_root, 1, true) or current_file:find(expanded_diary_root, 1, true)) then
		last_buffer = vim.api.nvim_get_current_buf()
	end
end

-- open (and create) file
local function open_wiki_file(path)
	local expanded_path = vim.fn.expand(path)
	local dir = vim.fn.fnamemodify(expanded_path, ":h")

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	vim.cmd("keepjumps edit " .. expanded_path)
end

-- create file without opening
local function create_wiki_file(path)
	local expanded_path = vim.fn.expand(path)
	local dir = vim.fn.fnamemodify(expanded_path, ":h")

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	if vim.fn.filereadable(expanded_path) == 0 then
		local file = io.open(expanded_path, "w")
		if file then
			file:close()
		end
	end
end

-- get date string with offset in days
local function get_date(offset)
	return os.date("%Y-%m-%d", os.time() + (offset or 0) * 86400)
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

	vim.keymap.set("n", "<leader>wt", function()
		udpdate_last_buffer()
		open_wiki_file(diary_root .. "/" .. get_date(0) .. ".md")
	end, { desc = "[WIKI] Open today's diary" })
end

-- Setup function
function setup()
	basic_keymaps()
	telescop_keymaps()

	vim.api.nvim_create_user_command("WikiDiaryToday", function()
		udpdate_last_buffer()
		open_wiki_file(diary_root .. "/" .. get_date(0) .. ".md")
	end, {})

	vim.api.nvim_create_user_command("WikiDiaryTmrw", function()
		udpdate_last_buffer()
		open_wiki_file(diary_root .. "/" .. get_date(1) .. ".md")
	end, {})

	vim.api.nvim_create_user_command("WikiDiaryYestarday", function()
		udpdate_last_buffer()
		open_wiki_file(diary_root .. "/" .. get_date(-1) .. ".md")
	end, {})

	vim.api.nvim_create_autocmd({ "BufWinLeave", "ExitPre" }, {
		pattern = "*.md",
		callback = function()
			local filepath = vim.fn.expand("%:p")
			if filepath:find(expanded_wiki_root, 1, true) then
				local bufnr = vim.api.nvim_get_current_buf()
				vim.cmd("w")
				if vim.fn.bufwinnr(bufnr) == -1 then
					vim.cmd("bd")
				end
			else
				vim.cmd("w")
			end
		end,
	})

	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = "*.md",
		callback = function()
			local filepath = vim.fn.expand("%:p")
			if filepath:find(expanded_wiki_root, 1, true) then
				vim.keymap.set("n", "<C-c>", ":bd<CR>", { buffer = true, desc = "[WIKI] Close buffer" })
			end
		end,
	})
end

setup()
