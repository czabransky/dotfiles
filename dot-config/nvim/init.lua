-- Load vimrc first, then override with nvim config.
vim.cmd([[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc
]])

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'

require("plugins.lazy")
require("plugins.telescope")


