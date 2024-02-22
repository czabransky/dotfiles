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
	nmap('<leader>ca', vim.lsp.buf.rename, '[C]ode [A]ction')
	nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')
	nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
end

-- List all Language Servers to Install:
-- The server names provided as keys are the lspconfig server names, not
-- mason's package names, so for example instead of "lua-language-server"
-- it's "lua_ls".
-- See: mason-lspconfig-mapping.txt
local servers = {
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { globals = { 'vim' } },
		},
	},

	--Debug pylsp settings with the following command:
	--	enew|put=execute(\"lua print(vim.inspect(vim.lsp.get_active_clients({name='pylsp'})))\")
	pylsp = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { 'W931' },
					maxLineLength = 100,
				},
			},
		},
	},

	-- Configuring Java for nvim is proving to be challenging
	--	see: https://github.com/mfussenegger/nvim-jdtls
	--java_language_server = {
	--	Java = {
	--		workspace = { checkThirdParty = false },
	--		telemetry = { enable = false },
	--	}
	--},
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

-- Enable LSP Status Information
require('fidget').setup({})

-- Modify some aesthetics of the LSP popup window. 
vim.opt.winhighlight = require('cmp').config.window.bordered().winhighlight
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
vim.diagnostic.config {
  float = { border = "rounded" },
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
}

