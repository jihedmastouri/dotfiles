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
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<ESC>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable() and cmp.visible() then
				cmp.abort()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<CR>"] = cmp.mapping.confirm(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
			end,
		},
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "emoji" },
		{ name = "calc" },
		{ name = "path" },
		-- { name = "nvim_lsp_signature_help" },
		{
			name = "look",
			keyword_length = 3,
			option = {
				convert_case = true,
				loud = true,
			},
		},
	},
	-- experimental = {
	-- 	ghost_text = true, -- this feature conflict with copilot.vim's preview.
	-- },
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
		{ name = "cmdline" },
	}),
})

cmp.setup({
	mapping = {
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
	},
})
