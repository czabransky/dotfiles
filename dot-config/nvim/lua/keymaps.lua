vim.keymap.set('n', '<leader>tt', function() return require('nvim-tree.api').tree.toggle({ find_file = true }) end, { desc = '[T]oggle [T]ree' })
