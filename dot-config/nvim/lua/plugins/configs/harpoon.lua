return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
	},
	config = function()
		local harpoon = require('harpoon')
		harpoon:setup()
		vim.keymap.set('n', '<leader>ha', function() harpoon:list():append() end, { desc = 'Append to Harpoon' })
		vim.keymap.set('n', '<leader>hh', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Show Harpoon Menu' })
		vim.keymap.set('n', '<leader>hn', function() harpoon:list():select(1) end, { desc = 'Select Harpoon 1' })
		vim.keymap.set('n', '<leader>he', function() harpoon:list():select(2) end, { desc = 'Select Harpoon 2' })
		vim.keymap.set('n', '<leader>hi', function() harpoon:list():select(3) end, { desc = 'Select Harpoon 3' })
		vim.keymap.set('n', '<leader>ho', function() harpoon:list():select(4) end, { desc = 'Select Harpoon 4' })
	end
}
