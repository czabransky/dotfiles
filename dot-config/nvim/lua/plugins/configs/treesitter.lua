return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	dependencies = {
		{ 'nvim-treesitter/nvim-treesitter-textobjects' },
	}, 
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = { 'lua', 'vim', 'vimdoc' },
			auto_install = true,
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-Space>',
					node_incremental = '<C-Space>',
					scope_incremental = '<C-s>',
					node_decremental = '<C-M-Space>',
				},
			},
		}
	end
}
