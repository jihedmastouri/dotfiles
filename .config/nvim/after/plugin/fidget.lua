require("fidget").setup({
  progress = {
    ignore_done_already = true,
    display = {
      render_limit = 5,
    },
  },
  notification = {
    view = {
      stack_upwards = false,
    },
    window = {
      winblend = 50,
			max_width = 40,
      max_height = 40,
    },
  },
})
