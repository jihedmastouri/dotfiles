-- Temp file management for current session
local temp_files = {}

local function create_new_temp_file()
    local output = vim.fn.system('mktmp')
    if vim.v.shell_error == 0 then
        local path = output:gsub('%s+$', '') -- Trim trailing whitespace
        table.insert(temp_files, path)
        vim.cmd('edit ' .. path)
    else
        vim.notify('Failed to create temp file', vim.log.levels.ERROR)
    end
end

local function create_or_open_temp_file()
    if #temp_files == 0 then
        create_new_temp_file()
    else
        local pickers = require('telescope.pickers')
        local finders = require('telescope.finders')
        local actions = require('telescope.actions')
        local conf = require('telescope.config').values

        local opts = {}
        pickers.new(opts, {
            prompt_title = "Select Temp File",
            finder = finders.new_table({
                results = vim.list_extend(vim.deepcopy(temp_files), {"Create New"}),
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry,
                        ordinal = entry,
                    }
                end,
            }),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = require('telescope.actions.state').get_selected_entry()
                    if selection.value == "Create New" then
                        create_new_temp_file()
                    else
                        vim.cmd('edit ' .. selection.value)
                    end
                end)
                return true
            end,
        }):find()
    end
end

vim.keymap.set('n', '<leader>t', create_or_open_temp_file, { silent = true })

vim.api.nvim_create_user_command('Tmpfile', create_or_open_temp_file, {})
vim.api.nvim_create_user_command('Tmpfilenew', create_new_temp_file, {})