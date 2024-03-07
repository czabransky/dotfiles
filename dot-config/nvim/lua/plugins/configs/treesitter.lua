return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = { 'BufEnter' },
	dependencies = {
		{ 'nvim-treesitter/nvim-treesitter-textobjects' },
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			auto_install = true,
			ensure_installed = {
				'lua',
				'markdown',
				'markdown_inline',
				'python',
				'vim',
				'vimdoc',
			},
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
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move= {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = '@class.outer',
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
					},
				},
			}
		}
	end
}
