-- [[ README  
--	for plugins to operate you will need:
--		ripgrep: https://github.com/BurntSushi/ripgrep

-- Load vimrc first, then override with nvim config.
vim.cmd([[ source ~/.vimrc ]])
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
vim.o.clipboard = 'unnamedplus'
--vim.o.completeopt = 'menuone, noselect'

require('plugins.lazy')
require('plugins.theme')
require('plugins.whichkey')
require('plugins.telescope')

-- [[ Highlight on Yank ]]
-- see `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank({
			timeout = 400
		})
	end,
	group = highlight_group,
	pattern = "*",
})
