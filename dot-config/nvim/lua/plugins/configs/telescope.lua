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
					}
				}
			}
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

		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = '[F]ind [T]elescpe Builtin' })
		vim.keymap.set('n', '<leader>f/', live_grep_open_files, { desc = '[F]ind [/] in Open Files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind Files With [G]rep' })
		vim.keymap.set('n', '<leader>fa', find_all_files, { desc = '[F]ind [A]ll Files' })
		vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind Current [W]ord' })
		vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume from Previous State' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Open [B]uffers' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[F]ind [G]it [F]iles' })
	end
}
