return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
		-- { 'nvim-telescope/telescope-ui-select.nvim' },
	},
	config = function()
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
						['<C-j>'] = require('telescope.actions').move_selection_next,
						['<C-k>'] = require('telescope.actions').move_selection_previous,
						['<C-q>'] = require('telescope.actions').smart_add_to_qflist + require('telescope.actions').open_qflist,
					}
				},
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = 'top',
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = false,
					},
				},
				sorting_strategy = 'ascending',
			},
		}
		pcall(require('telescope').load_extension, 'fzf')
		-- pcall(require('telescope').load_extension, 'ui-select')

		local builtin = require('telescope.builtin')

		local function find_all_files()
			builtin.find_files {
				prompt_title = 'Find All Files',
				hidden = true,
				find_command = { 'rg', '--files', '-uu',
					'-g', '!.git',
					'-g', '!lib/',
					'-g', '!__pycache__/',
					'-g', '!venv/'
				},
			}
		end

		local function live_grep_open_files()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files'
			}
		end

		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [T]elescpe Builtin' })
		vim.keymap.set('n', '<leader>s/', live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch Files With [G]rep' })
		vim.keymap.set('n', '<leader>sa', find_all_files, { desc = '[S]earch [A]ll Files' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch Current [W]ord' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume from Previous State' })
		vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch Open [B]uffers' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
	end
}
