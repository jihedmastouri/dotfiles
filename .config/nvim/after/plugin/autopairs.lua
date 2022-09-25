local npairs = require("nvim-autopairs")
npairs.setup({ map_cr = false })

-- skip it, if you use another global object
_G.MUtils = {}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
