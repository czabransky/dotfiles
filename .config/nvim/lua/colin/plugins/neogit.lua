return {
	'NeogitOrg/neogit',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'sindrets/diffview.nvim' },
	},
	init = function()
		vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = '[G]it' })
	end,
	config = true, -- must be true? didn't dive into this

}
