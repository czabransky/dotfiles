local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local setup = require('colin.lsp.lsp-setup')
local attach = require('colin.lsp.lsp-attach')

lspconfig.pylsp.setup({
	capabilities = setup.capabilities_with_snippets,
	filetypes = {
		'py',
		'python',
	},
	settings = {
		pylsp = {
			plugins = {
				flake8 = { enabled = false, },
				pyflakes = { enabled = false, },
				pycodestyle = {
					ignore = {
						'W931',
						'W503' -- Binary operator occurs before line break
					},
					maxLineLength = 150,
				},
			},
		},
	},
	on_attach = attach.on_attach,
})
