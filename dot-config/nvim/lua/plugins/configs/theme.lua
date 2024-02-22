local M = {}

function M.onedark()
	return {
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('onedark').setup {
				style = 'dark',
				toggle_style_key = '<leader>ts',
			}
			vim.cmd.colorscheme 'onedark'
		end
	}
end

function M.catppuccin()
	return {
		'catppuccin/nvim',
		lazy = false,
		priority = 1000,
	}
end

function M.gruvbox()
	return {
		'morhetz/gruvbox',
		lazy = false,
		priority = 1000,
	}
end

return M
