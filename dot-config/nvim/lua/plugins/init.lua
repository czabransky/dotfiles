-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup ({
	require('plugins.configs.theme').onedark(),
	require('plugins.configs.tree').nvimtree(),
	require('plugins.configs.whichkey'),
	require('plugins.configs.telescope'),
	require('plugins.configs.treesitter'),
	require('plugins.configs.lualine'),
	require('plugins.configs.mini-starter'),
	require('plugins.configs.mini-sessions'),
	require('plugins.configs.mini-comment'),

	{ 'folke/noice.nvim', event = 'VeryLazy', dependencies = { 'MunifTanjim/nui.nvim' } },
	{ 'folke/twilight.nvim', opts = {} },
	{ 'folke/zen-mode.nvim', opts = {} },
	{ 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },
	{ 'tpope/vim-surround' },

	-- [[ Fuzzy Finder ]]
	-- [[ Only enable this if you're unable to install ripgrep ]]
	--require('plugins.configs.mini-fuzzy'),

	-- [[ LSP ]]
	{ 'neovim/nvim-lspconfig', dependencies = {
		{ 'williamboman/mason.nvim', config = true },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'j-hui/fidget.nvim', opts = {} },
		{ 'folke/neodev.nvim', opts = {} },
	}},

	-- [[ Auto Completion ]]
	{ 'hrsh7th/nvim-cmp', dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'L3MON4D3/LuaSnip' },
	}},
})
