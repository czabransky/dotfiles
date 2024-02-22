--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

	for plugins to operate you will need:
		- ripgrep: https://github.com/BurntSushi/ripgrep
		- a java sdk

	It is a good idea to run `:checkhealth` after your first time initiailizing nvim to check for any issues.

--]]

require('settings').setup({
	inherit_vimrc = true,
	leader = ' ',
})

require 'plugins'
require 'keymaps'
require 'lsp'
require 'autocmd'
