--[[
	- NeoVim >= 0.8.0 (this plugin uses `vim.fs` which was only added in 0.8).
	- If you want completion and search features (recommended) you’ll need ripgrep <https://github.com/BurntSushi/ripgrep> to be installed and on your `$PATH`.
		See ripgrep#installation <https://github.com/BurntSushi/ripgrep> for install options.

	Specific operating systems also require additional dependencies in order to use
	all of obsidian.nvim’s functionality:

	- **Windows WSL** users need `wsl-open` <https://gitlab.com/4U6U57/wsl-open> for the `:ObsidianOpen` command.
	- **MacOS** users need `pngpaste` <https://github.com/jcsalterego/pngpaste> (`brew install pngpaste`) for the `:ObsidianPasteImg` command.
	- **Linux** users need xclip (X11) or wl-clipboard (Wayland) for the `:ObsidianPasteImg` command.
]]

return {
	'epwalsh/obsidian.nvim',
	version = '*',
	lazy = true,
	ft = 'markdown',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
	},
	opts = {},
	config = function()
		require('obsidian').setup({
			workspaces = {
				{
					name = 'buf-parent',
					path = function()
						return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
					end,
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			picker = {
				name = 'telescope.nvim',
				note_mappings = {
					-- new = '<C-x>',
					insert_link = '<C-l>',
				},
			},
			mappings = {
				['gf'] = {
					action = function()
						return require('obsidian').util.gf_passthrough()
					end,
					opts = { noremap = false, expr = false, buffer = true },
				},
			},
			ui = {
				enable = false
			},
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				-- vim.fn.jobstart({ "open", url }) -- Mac OS
				-- vim.fn.jobstart({ "xdg-open", url }) -- linux
				-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
				vim.ui.open(url) -- need Neovim 0.10.0+
			end,
		})
	end
}
