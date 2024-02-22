local M = {}

function M.nvimtree()
	return {
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
		},
		config = function()
			require('nvim-tree').setup({
				view = {
					float = {
						-- Set enable to true if prefer a floating file explorer.
						enable = true,
						open_win_config = {
							width = 100,
						},
					},
					width = 50,
				},
			})
			vim.keymap.set('n', '<leader>tt', function() return require('nvim-tree.api').tree.toggle({ find_file = true }) end, { desc = '[T]oggle [T]ree' })
		end
	}
end

function M.neotree()
	return {
		'nvim-neo-tree/neo-tree.nvim',
		version = 'v3.x',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'MunifTanjim/nui.nvim' },
		},
		config = function()
			require('neo-tree').setup({
				default_component_configs = {
					container = {
						enable_character_fade = true,
					},
				},
				enable_diagnostics = true,
				enable_git_status = true,
				popup_border_style = 'rounded',
			})
			vim.keymap.set('n', '<leader>tt', '<cmd>Neotree<CR>', { desc = '[T]oggle [T]ree' })
		end,
	}
end

return M