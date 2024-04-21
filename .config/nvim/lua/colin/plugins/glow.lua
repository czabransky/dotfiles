return {
	"ellisonleao/glow.nvim",
	cmd = "Glow",
	config = function()
		require('glow').setup({
			border = 'rounded',
			style = "dark"
		})
	end,
}
