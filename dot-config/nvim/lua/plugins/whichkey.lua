require('which-key').setup {
	icons = {
		separator = "-> "
	}
}

require('which-key').register {
	['<leader>w'] = { name = '[W]indows' },
	['<leader>s'] = { name = '[S]earch' },
	['<leader>g'] = { name = '[G]it' },
}

vim.keymap.set('n', '<leader>q', ':q', { desc = 'Quit' })
