--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

	for plugins to operate you will need:
		- ripgrep: https://github.com/BurntSushi/ripgrep
		- a java sdk

	It is a good idea to run `:checkhealth` after your first time initiailizing nvim to check for any issues.

	Useful Information:
		[LSP Servers, Linters, Formatters, and Treesitter](https://roobert.github.io/2022/12/03/Extending-Neovim/)
--]]

require 'debug'

require('settings').setup({
	inherit_vimrc = true,
	leader = ' ',
})

require 'plugins'
require 'keymaps'
require 'autocmd'
