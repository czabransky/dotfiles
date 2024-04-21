require('colin.core.options').setup({
	inherit_vimrc = true,
	leader = ' ',
})
require('colin.core.autocmd')
require('colin.core.keymaps')
require('colin.lazy')
