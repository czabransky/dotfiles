return {
	'folke/noice.nvim',
	dependencies = {
		{ 'MunifTanjim/nui.nvim' },
		{ 'rcarriga/nvim-notify' },
	},
	event = 'VeryLazy',
	opts = {},
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			views = {
				mini = {
					win_options = {
						winblend = 0,
					},
				},
			},
		})
		vim.keymap.set({ "n", "i", "s" }, "<c-s>", function()
			if not require("noice.lsp").scroll(4) then
				return "<c-s>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<c-f>"
			end
		end, { silent = true, expr = true })
	end
}
