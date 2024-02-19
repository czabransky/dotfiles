vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup()

local api = require('nvim-tree.api')

vim.keymap.set('n', '<leader>tt', function() return api.tree.toggle({ find_file = true }) end, { desc = '[T]oggle [T]ree' })
