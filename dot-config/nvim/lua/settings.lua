
-- Inherit from .vimrc, then override as needed
vim.cmd([[ source ~/.vimrc ]])
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
	clipboard = 'unnamed,unnamedplus',
	completeopt = 'menuone',
	termguicolors = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- Set Space as the Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Select a Theme
require('theme').set_theme('onedark')
