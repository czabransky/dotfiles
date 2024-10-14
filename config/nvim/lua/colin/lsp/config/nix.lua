local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local setup = require('colin.lsp.lsp-setup')
local attach = require('colin.lsp.lsp-attach')

lspconfig.nil_ls.setup({
	capabilities = setup.capabilities_with_snippets,
	filetypes = {
		'nix',
	},
	settings = {
		['nil'] = {
			formatting = {
				command = { 'nixfmt' },
			},
		},
	},
	on_attach = attach.on_attach,
})
