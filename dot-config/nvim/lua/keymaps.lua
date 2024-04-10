-- [[ Diagnostics ]]

vim.keymap.set('n', ']d', function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys('zz', 'n', false)
end, { desc = 'Go to Next Diagnostic' })

vim.keymap.set('n', '[d', function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys('zz', 'n', false)
end, { desc = 'Go to Previous Diagnostic' })

vim.keymap.set('n', ']e', function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys('zz', 'n', false)
end, { desc = 'Go to Next Error' })

vim.keymap.set('n', '[e', function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys('zz', 'n', false)
end, { desc = 'Go to Previous Error' })

vim.keymap.set('n', ']w', function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys('zz', 'n', false)
end, { desc = 'Go to Next Warning' })

vim.keymap.set('n', '[w', function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys('zz', 'n', false)
end, { desc = 'Go to Previous Warning' })

vim.keymap.set('n', '<leader>ld', vim.diagnostic.setqflist, { desc = 'Quickfix [L]ist [D]iagnostics' })
vim.keymap.set('n', '<leader>cn', ':cnext<CR>zz', { desc = 'Navigate to [N]ext Quickfix Item' })
vim.keymap.set('n', '<leader>cp', ':cprevious<CR>zz', { desc = 'Navigate to [P]revious Quickfix Item' })
vim.keymap.set('n', '<leader>co', ':copen<CR>', { desc = '[O]pen the Quickfix List' })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { desc = '[C]lose the Quickfix List' })
vim.keymap.set('n', '<leader>cv', '<cmd>vimgrep PeaceChatFeedbackButton **/.py<CR>',
	{ desc = '[V]imgrep Current Project' })


vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = '[G]it' })
