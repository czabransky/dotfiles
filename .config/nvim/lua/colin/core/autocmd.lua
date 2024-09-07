vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable newline comments when inserting lines with o/O",
	group = defaults,
	pattern = { "*" },
	callback = function() vim.opt_local.formatoptions:remove("o") end,
})

-- [[ This will switch colorscheme when flipping between filetypes, but it can be jarring when opening pickers. ]]
-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
-- 	group = defaults,
-- 	pattern = { '*' },
-- 	callback = function()
-- 		vim.cmd [[ colorscheme catppuccin-frappe ]]
-- 	end
-- })

-- set colorscheme for markdown files
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
	group = defaults,
	pattern = { '*.md' },
	callback = function()
		vim.cmd [[ colorscheme tokyonight-night ]]
	end
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	desc = "Change colorscheme for Markdown files",
-- 	group = defaults,
-- 	pattern = { "*.md" },
-- 	callback = function() vim.cmd('colorscheme tokyonight-night') end,
-- })



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
