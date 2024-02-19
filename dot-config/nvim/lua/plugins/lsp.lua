require('mason').setup()
require('mason-lspconfig').setup()
require('neodev').setup()

--Define a function for on_attach, which will be executed each time an LSP is attached to a buffer.
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
	nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
end

-- List all Language Servers to Install
local servers = {
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Mason will ensure LSPs are installed
require('mason-lspconfig').setup {
	ensure_installed = vim.tbl_keys(servers),
}

-- Add cmp_nvim's additional auto completion to language servers
local capabilities = require('cmp_nvim_lsp').default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

-- Initialize Handlers for each Langauge Server
require('mason-lspconfig').setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end,
}
