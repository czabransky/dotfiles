local M = {}

local function inherit_vimrc()
	vim.cmd([[ source ~/.vimrc ]])
end

local function opt_overrides()
	local options = {
		clipboard = 'unnamed,unnamedplus',
		completeopt = 'menuone',
		mouse = "a",
		termguicolors = true,
		signcolumn = "yes",
		conceallevel = 1,
	}
	for key, value in pairs(options) do
		vim.opt[key] = value
	end
end

local function leader(key)
	vim.g.mapleader = key
	vim.g.maplocalleader = key
end

function M.setup(opts)
	if opts.inherit_vimrc then
		inherit_vimrc()
	end
	opt_overrides()
	leader(opts.leader)
	vim.g.netrw_browse_split = 0
	vim.g.netrw_banner = 1
	vim.g.netrw_winsize = 25
end

return M
