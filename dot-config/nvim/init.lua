-- Load vimrc first, then override with nvim config.
vim.cmd([[ source ~/.vimrc ]])

require('plugins.lazy')
require('plugins.theme')
require('plugins.whichkey')
require('plugins.telescope')
