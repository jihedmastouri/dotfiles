local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<C-n>", mark.add_file, default_opts)
map("n", "<C-p>", ui.toggle_quick_menu, default_opts)


for i = 1, 9, 1 do
  map("n", string.format("<Space>%s", i), function()
    ui.nav_file(i)
  end, default_opts)
end
map("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)", default_opts)
