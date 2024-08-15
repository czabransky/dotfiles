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
			compress_after = 2,
			group_mappings = false,
			show_leader = true,
		})
	end
}
