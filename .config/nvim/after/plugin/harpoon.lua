local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<C-n>", mark.add_file)
keymap("n", "<C-l>", ui.toggle_quick_menu)


for i = 1, 9, 1 do
  keymap("n", string.format("<Space>%s", i), function()
    ui.nav_file(i)
  end)
end
keymap("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)")
