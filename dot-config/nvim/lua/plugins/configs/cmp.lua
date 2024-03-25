return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'onsails/lspkind.nvim' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'L3MON4D3/LuaSnip' },
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local lspkind = require('lspkind')

		-- Load Snippets
		require('luasnip.loaders.from_vscode').lazy_load()

		-- Configure Auto Completion
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-k>'] = cmp.mapping.select_prev_item(),
				['<C-j>'] = cmp.mapping.select_next_item(),
				['<C-Space>'] = cmp.mapping.complete({}), -- Open Completion Suggestion
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept Suggestion
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),

				['<C-u>'] = cmp.mapping.scroll_docs(4), -- Scroll Up Preview
				['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Scroll Up Preview
				['<C-c>'] = cmp.mapping.abort(), -- Close Suggestions
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'buffer',  max_item_count = 5 },
				{ name = 'path',    max_item_count = 3 },
				{ name = 'path',    max_item_count = 3 },
				{ name = 'luasnip', max_item_count = 3 },
			}),
			formatting = {
				expandable_indicator = true,
				format = lspkind.cmp_format({
					node = 'symbol_text',
					maxwidth = 50,
					ellipsis_char = '...',
				}),
				fields = { 'abbr', 'kind', 'menu' },
			},
			experimental = {
				ghost_text = false,
			}
		})
		-- cmp.setup.filetype('py', {
		-- 	sources = cmp.config.sources({
		-- 		{ name = 'nvim_lsp' },
		-- 		{ name = 'buffer',  max_item_count = 5 },
		-- 		{ name = 'path',    max_item_count = 3 },
		-- 		{ name = 'path',    max_item_count = 3 },
		-- 	}),
		-- })
	end
}
