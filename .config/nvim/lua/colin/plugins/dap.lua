return {
	'mfussenegger/nvim-dap',
	dependencies = {
		{ 'rcarriga/nvim-dap-ui' },
		{ 'nvim-neotest/nvim-nio' },
		{ 'theHamsta/nvim-dap-virtual-text' },
		{ 'mfussenegger/nvim-dap-python' },
	},
	config = function()
		local dap = require('dap')
		local ui = require('dapui')
		require('nvim-dap-virtual-text').setup({})

		ui.setup({
			layouts = {
				{
					elements = {
						'scopes',
					},
					size = 70,
					position = 'right',
				},
				{
					elements = {
						'repl'
					},
					size = 0.40,
					position = 'bottom',
				},
				-- {
				-- 	elements = {
				-- 		'stacks',
				-- 		'watches',
				-- 		'console'
				-- 	},
				-- 	size = 0,
				-- 	position = 'right'
				-- },
			},
		})

		dap.configurations = {
			python = {
				{
					type = 'python',
					request = 'launch',
					name = 'Module',
					pythonPath = 'python',
					program = '${file}',
					cwd = '${workspaceFolder}'
				},
			}
		}

		vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
		vim.keymap.set('n', '<leader>gb', dap.run_to_cursor, { desc = 'Debug to Cursor' })
		vim.keymap.set('n', '<leader>?', function()
			require('dapui').eval(nil, { enter = true })
		end, { desc = 'Evaluate Symbol under Cursor' })
		vim.keymap.set('n', '<F1>', dap.continue, { desc = 'Debug: Continue' })
		vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debug: Step Into' })
		vim.keymap.set('n', '<F3>', dap.step_over, { desc = 'Debug: Step Over' })
		vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Debug: Step Out' })
		vim.keymap.set('n', '<F5>', dap.step_back, { desc = 'Debug: Step Back' })
		vim.keymap.set('n', '<F8>', dap.restart, { desc = 'Debug: Restart' })
		vim.keymap.set('n', '<F10>', dap.terminate, { desc = 'Debug: Stop' })

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end

		-- Python
		require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
		require('dap-python').test_runner = 'pytest'
	end
}
