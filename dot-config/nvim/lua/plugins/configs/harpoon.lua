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
		vim.keymap.set('n', '<leader>hh', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
			{ desc = 'Show Harpoon Menu' })
		vim.keymap.set('n', '<leader>hn', function() harpoon:list():select(1) end, { desc = 'Select Harpoon 1' })
		vim.keymap.set('n', '<leader>he', function() harpoon:list():select(2) end, { desc = 'Select Harpoon 2' })
		vim.keymap.set('n', '<leader>hi', function() harpoon:list():select(3) end, { desc = 'Select Harpoon 3' })
		vim.keymap.set('n', '<leader>ho', function() harpoon:list():select(4) end, { desc = 'Select Harpoon 4' })

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end

		vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
	end
}
