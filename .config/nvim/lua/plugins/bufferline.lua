require"bufferline".setup {
	options = {
		numbers = "ordinal",
		diagnostics = "coc",
		show_close_icon = false,
		show_buffer_close_icons = false,
		offsets = {{filetype = "NvimTree", text = "File Explorer" }},
		tab_size = 13,
		enforce_regular_tabs = true,
		diagnostics_indicator = function(count, level)
			if (level:match("error")) then
				return " " .. " " .. count
			else
				return ""
			end
		end,
	},
	-- highlights = {
	-- 	separator = {
	-- 	  guifg = '#15161E',
	-- 	},
	-- 	separator_visible = {
	-- 	  guifg = '#15161E',
	-- 	},
	-- 	separator_selected = {
	-- 	 guifg = '#15161E',
	-- 	  },
	-- }
}
