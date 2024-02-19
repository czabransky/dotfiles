--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

	for plugins to operate you will need:
		ripgrep: https://github.com/BurntSushi/ripgrep

	It is a good idea to run `:checkhealth` after your first time initiailizing nvim to check for any issues.

--]]

vim.cmd([[ source ~/.vimrc ]])
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
vim.o.clipboard = 'unnamedplus'
vim.o.termguicolors = true
--vim.o.completeopt = 'menuone, noselect'

require('keymaps')
require('plugins.lazy')
require('plugins.theme')
require('plugins.nvimtree')
require('plugins.lualine')
require('plugins.twilight')
require('plugins.whichkey')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lsp')

-- [[ Highlight on Yank ]]
-- see `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank({
			timeout = 250
		})
	end,
	group = highlight_group,
	pattern = "*",
})
