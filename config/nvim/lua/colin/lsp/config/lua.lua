local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local setup = require('colin.lsp.lsp-setup')
local attach = require('colin.lsp.lsp-attach')

lspconfig.lua_ls.setup({
	capabilities = setup.capabilities_with_snippets,
	filetypes = {
		'lua',
	},
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { -- https://luals.github.io/wiki/diagnostics/
				globals = { 'vim' },
				undefined_global = false,
				disable = {
					'missing-parameters', 'missing-fields', -- LSP reports missing fields for tables which are not required.
					'trailing-space'
				},
			},
		},
	},
	on_attach = attach.on_attach,
})
