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
vim.opt.rtp:prepend(lazypath) -- noqa

require('lazy').setup({
	checker = {
		enabled = true,
		notify = true,
	},
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

	require('colin.plugins.alpha'),
	require('colin.plugins.chatgpt'),
	require('colin.plugins.cmp'),
	require('colin.plugins.dadbod'),
	require('colin.plugins.dadbod-ui'),
	require('colin.plugins.dap'),
	require('colin.plugins.dressings'),
	require('colin.plugins.gitsigns'),
	require('colin.plugins.glow'),
	require('colin.plugins.harpoon'),
	require('colin.plugins.indent-blankline'),
	require('colin.plugins.lsp'),
	require('colin.plugins.lualine'),
	require('colin.plugins.markdownpreview'),
	require('colin.plugins.mini-comment'),
	require('colin.plugins.noice'),
	require('colin.plugins.notify'),
	require('colin.plugins.obsidian'),
	require('colin.plugins.quick-scope'),
	require('colin.plugins.render-markdown'),
	require('colin.plugins.screenkey'),
	require('colin.plugins.telescope'),
	require('colin.plugins.theme').catppuccin(),
	require('colin.plugins.todo-comments'),
	require('colin.plugins.transparent'),
	require('colin.plugins.tree').nvimtree(),
	require('colin.plugins.treesitter'),
	require('colin.plugins.trouble'),
	require('colin.plugins.twilight'),
	require('colin.plugins.vim-surround'),
	require('colin.plugins.vim-tmux-navigator'),
	require('colin.plugins.whichkey'),
	require('colin.plugins.zen-mode'),
})
