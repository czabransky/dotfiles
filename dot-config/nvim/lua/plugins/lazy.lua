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

require('lazy').setup {
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{ 'morhetz/gruvbox', name = 'gruvbox', priority = 1000 },
	{ 'navarasu/onedark.nvim', name = 'onedark', priority = 1000 },
	{ 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
	{ 'nvim-lualine/lualine.nvim' },
	{ 'folke/noice.nvim', event = 'VeryLazy', dependencies = { 'MunifTanjim/nui.nvim' } },
	{ 'folke/twilight.nvim', opts = {} },
	{ 'folke/zen-mode.nvim', opts = {} },
	{ 'folke/which-key.nvim', opts = {} },
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
	{ 'nvim-treesitter/nvim-treesitter', dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' }, build = ':TSUpdate' },
	{ 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },

	--[[ Optional ]]
	--{ 'tpope/vim-surround' },
	
	--LSP
	{ 'neovim/nvim-lspconfig', dependencies = {
		{ 'williamboman/mason.nvim', config = true },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'j-hui/fidget.nvim', opts = {} },
		{ 'folke/neodev.nvim', opts = {} },
	}},
}

require('mason').setup()
require('mason-lspconfig').setup()
require('neodev').setup()

--local servers = {
--	lua_ls = {
--		Lua = {
--			workspace = { checkThirdParty = false },
--			telemetry = { enable = false },
--		},
--	},
--}
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
