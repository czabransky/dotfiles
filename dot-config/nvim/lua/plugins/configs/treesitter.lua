return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	dependencies = {
		{ 'nvim-treesitter/nvim-treesitter-textobjects' },
	}, 
	config = function()
		require('nvim-treesitter.configs').setup {
			auto_install = true,
			ensure_installed = { 'lua', 'vim', 'vimdoc' },
			highlight = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-Space>',
					node_incremental = '<C-Space>',
					scope_incremental = '<C-s>',
					node_decremental = '<C-M-Space>',
				},
			},
			ignore_install = {},
			indent = { enable = true },
			modules = {},
			sync_install = true,
		}
	end
}
