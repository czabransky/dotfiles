return {
	'echasnovski/mini.starter',
	version = '*',
	dependencies = {
		{ 'echasnovski/mini.sessions' },
		{ 'echasnovski/mini.comment' },
	},
	config = function()
		local starter = require('mini.starter')
		starter.setup({
			autoopen = false,
			evaluate_single = false,
			items = {
				starter.sections.builtin_actions(),
				starter.sections.sessions(),
				starter.sections.telescope(),
				starter.sections.recent_files(10, true, true),
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning('center', 'center'),
				starter.gen_hook.indexing('all', { 'Builtin actions', 'Sessions', 'Telescope' }),
			},
		})

		-- There is an issue where mini.starter does not show any old files in the recent files list.  
		-- Force shared data to load before vim.v.oldfiles.
		vim.cmd([[ rshada ]])

		-- Despite having autoopen = true above, MiniStarter isn't opening automatically or appearing as a command.
		-- Invoke the manually. 
		starter.open()
	end
}
