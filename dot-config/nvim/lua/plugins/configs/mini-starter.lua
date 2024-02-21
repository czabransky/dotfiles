return {
	'echasnovski/mini.starter',
	version = '*',
	config = function()
		local starter = require('mini.starter')
		starter.setup({
			autoopen = true,
			evaluate_single = false,
			items = {
				starter.sections.builtin_actions(),
				starter.sections.sessions(),
				starter.sections.telescope(),
				starter.sections.recent_files(10, true),
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning('center', 'center'),
				starter.gen_hook.indexing('all', { 'Builtin actions', 'Sessions', 'Telescope' }),
			},
		})
	end
}
