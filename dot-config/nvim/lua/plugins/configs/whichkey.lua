return {
	'folke/which-key.nvim',
	opts = {},
	config = function()
		local wk = require('which-key')
		wk.setup()
		wk.register({
			['<leader>g'] = { name = '[G]it', },
			['<leader>s'] = { name = '[S]earch', },
			['<leader>t'] = {
				name = '[T]oggle',
				tt = { function() return require('nvim-tree.api').tree.toggle({find_file = true}) end, '[T]oggle [Tr]ee' },
				tw = { '<cmd>Twilight<CR>', '[T]oggle [T]wilight' },
			},
			['<leader>w'] = { name = '[W]orkspace', },
		}, { mode = 'n', prefix = '', noremap = true, nowait = true})
	end,
}
