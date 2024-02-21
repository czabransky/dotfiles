return {

	starter = {
		'echasnovski/mini.starter',
		version = '*',
		config = function()
			local mini_starter = require('mini.starter')
			mini_starter.setup({
				autoopen = true,
				evaluate_single = false,
				items = {
					mini_starter.sections.builtin_actions(),
					mini_starter.sections.sessions(),
					mini_starter.sections.telescope(),
					mini_starter.sections.recent_files(10, true),
				},
				content_hooks = {
					mini_starter.gen_hook.adding_bullet(),
					mini_starter.gen_hook.aligning('center', 'center'),
					mini_starter.gen_hook.indexing('all', { 'Builtin actions', 'Sessions', 'Telescope' }),
				},
			})
		end
	},

	sessions = {
		'echasnovski/mini.sessions',
		version = '*',
		config = function()
			local mini_sessions = require('mini.sessions')
			mini_sessions.setup({
				autoread = false,
				autowrite = true,
			})
		end
	},

	comments = {
		'echasnovski/mini.comment',
		version = '*',
		config = function()
			local mini_comment = require('mini.comment')
			mini_comment.setup()
		end
	},

}
