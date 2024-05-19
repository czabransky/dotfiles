return {
	"czabransky/screenkey.nvim",
	cmd = "Screenkey",
	version = "*",
	config = function()
		require('screenkey').setup({
			win_opts = {
				row_adjustment = -10,
				width = 60,
			},
		})
	end
}
