return {
	'navarasu/onedark.nvim', name = 'onedark', priority = 1000,
	config = function()
		require('onedark').setup {
			style = 'dark',
			toggle_style_key = '<leader>ts',
		}
		vim.cmd.colorscheme 'onedark'
	end
}
