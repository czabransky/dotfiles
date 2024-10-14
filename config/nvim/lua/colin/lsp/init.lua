require('mason-lspconfig').setup {
	ensure_installed = vim.tbl_keys({
		nil_ls = {},
		lua_ls = {},
		pylsp = {},
		omnisharp = {},
		html = {},
		cssls = {},
		emmet_ls = {},
		ts_ls = {},
		jsonls = {},
		sqlls = {},
	}),
}
require('colin.lsp.config.nix')
require('colin.lsp.config.lua')
require('colin.lsp.config.python')
require('colin.lsp.config.csharp')
require('colin.lsp.config.css')
require('colin.lsp.config.js_ts')
