return {
	'jackMort/ChatGPT.nvim',
	dependencies = {
		{ 'MunifTanjim/nui.nvim' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'folke/trouble.nvim' },
		{ 'nvim-telescope/telescope.nvim' },
	},
	event = 'VeryLazy',
	config = function()
		require('chatgpt').setup({
			chat = {
				welcome_message = 'How can I help?',
			},
			vim.keymap.set('n', '<leader>cg', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT' })
		})
	end
}
