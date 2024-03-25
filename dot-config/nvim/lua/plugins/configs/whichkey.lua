return {
	'folke/which-key.nvim',
	opts = {},
	config = function()
		local wk = require('which-key')
		wk.setup()
		wk.register({
			['<leader>c'] = { name = '[C]ode' },
			['<leader>d'] = { name = '[D]ocument' },
			['<leader>g'] = { name = '[G]it' },
			['<leader>h'] = { name = '[H]arpoon' },
			['<leader>s'] = { name = '[S]earch' },
			['<leader>t'] = {
				name = '[T]oggle',
				w = { '<cmd>Twilight<CR>', '[T]oggle [T]wilight' },
			},
			['<leader>w'] = { name = '[W]orkspace', },
		}, { mode = 'n', prefix = '', noremap = true, nowait = true })
	end,
}
