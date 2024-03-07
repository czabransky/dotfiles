
return {
	'epwalsh/obsidian.nvim',
	version = '*',
	lazy = true,
	ft = 'markdown',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
	},
	opts = {},
	config = function()
		require('obsidian').setup({
			workspaces = {
				{
					name = 'buf-parent',
					path = function()
						return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
					end,
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			picker = {
				name = 'telescope.nvim',
				mappings = {
					-- new = '<C-x>',
					insert_link = '<C-l>',
				},
			},
			mappings = {
				['gf'] = {
					action = function()
						return require('obsidian').util.gf_passthrough()
					end,
					opts = { noremap = false, expr = false, buffer = true },
				},
			},

		})
	end
}
