local M = {}
local themes = {
	onedark = {
		'navarasu/onedark.nvim', 
		config = function()
			require('onedark').setup {
				style = 'dark',
				toggle_style_key = '<leader>ts',
			}
			vim.cmd.colorscheme 'onedark'
		end
	},
	catppuccin = { 'catppuccin/nvim' },
	gruvbox = { 'morhetz/gruvbox' },
}

M.set_theme = function(theme_name) 
	M.theme_name = theme_name
end

M.get_theme = function() 
	theme = themes[M.theme_name]
	theme.lazy = false
	theme.priority = 1000
	return theme
end

return M
