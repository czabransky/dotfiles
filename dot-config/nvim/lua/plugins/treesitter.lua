require('nvim-treesitter.configs').setup {
	ensure_installed = { 'lua', 'vim', 'vimdoc' }
	auto_install = true,
	sync_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			--see :`help key-notation`
			init_selection = '<C-Space>'
			node_incremental = '<C-Space>'
			scope_incremental = '<C-s>'
			node_decremental = '<M-Space>' --Won't work on Windows, Alt+Space is reserved.
		},
	},
}
