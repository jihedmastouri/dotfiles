local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[BUF]",
				luasnip = "[LSnip]",
				path = "[Path]",
				calc = "[Calc]",
				nvim_treesitter = "[TS]",
				emoji = "[Emoji]",
				look = "[Look]",
			},
		}),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
			["<C-x><C-l>"] = cmp.mapping.complete({
			config = {
				sources = {
					{
						name = "buffer-lines",
						option = {
							leading_whitespace = true,
						},
					},
				},
			},
		}),
			["<C-x><C-k>"] = cmp.mapping.complete({
			config = {
				sources = {
					{ name = "calc" },
					{ name = "emoji" },
					{
						name = "look",
						option = {
							convert_case = true,
							loud = true,
						},
					},
				},
			},
		}),
	},
	sources = {
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
			end,
		},
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	formatting = {
		fields = { "abbr" },
	},
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
		},
	}),
})
