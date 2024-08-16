-- https://github.com/jackMort/ChatGPT.nvim
--		<C-Enter> [Both] to submit.
-- 		<C-y> [Both] to copy/yank last answer.
-- 		<C-o> [Both] Toggle settings window.
-- 		<C-h> [Both] Toggle help window.
-- 		<Tab> [Both] Cycle over windows.
-- 		<C-f> [Chat] Cycle over modes (center, stick to right).
-- 		<C-c> [Both] to close chat window.
-- 		<C-p> [Chat] Toggle sessions list.
-- 		<C-u> [Chat] scroll up chat window.
-- 		<C-d> [Chat] scroll down chat window.
-- 		<C-k> [Chat] to copy/yank code from last answer.
-- 		<C-n> [Chat] Start new session.
-- 		<C-r> [Chat] draft message (create message without submitting it to server)
-- 		<C-r> [Chat] switch role (switch between user and assistant role to define a workflow)
-- 		<C-s> [Both] Toggle system message window.
-- 		<C-i> [Edit Window] use response as input.
-- 		<C-d> [Edit Window] view the diff between left and right panes and use diff-mode commands
return {
	'jackMort/ChatGPT.nvim',
	dependencies = {
		{ 'MunifTanjim/nui.nvim' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'folke/trouble.nvim' },
		{ 'nvim-telescope/telescope.nvim' },
	},
	event = 'VeryLazy',
	config = function()
		require('chatgpt').setup({
			chat = {
				welcome_message = 'How can I help?',
			},
			vim.keymap.set('n', '<leader>cg', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT' })
		})
	end
}
