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

require('lazy').setup({
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		border = "single",
	},
	require('plugins.configs.cmp'),
	require('plugins.configs.dressings'),
	require('plugins.configs.gitsigns'),
	require('plugins.configs.harpoon'),
	require('plugins.configs.indent_blankline'),
	require('plugins.configs.lsp'),
	require('plugins.configs.lualine'),
	require('plugins.configs.mini-comment'),
	require('plugins.configs.mini-sessions'),
	require('plugins.configs.mini-starter'),
	require('plugins.configs.notify'),
	require('plugins.configs.telescope'),
	require('plugins.configs.theme').catppuccin(),
	require('plugins.configs.tree').nvimtree(),
	require('plugins.configs.treesitter'),
	require('plugins.configs.noice'),
	require('plugins.configs.whichkey'),

	{ 'tpope/vim-dadbod' },
	require('plugins.configs.dadbod-ui'),

	{ 'folke/twilight.nvim', opts = {} },
	{ 'folke/zen-mode.nvim', opts = {} },
	{ 'folke/trouble.nvim',  dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },
	{ 'tpope/vim-surround' },

	require('plugins.configs.glow'),
	require('plugins.configs.obsidian'),
	require('plugins.configs.markdownpreview'),
	require('plugins.configs.chatgpt'),
})