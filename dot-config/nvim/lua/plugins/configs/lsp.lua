return {

	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim',          config = true },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'j-hui/fidget.nvim',                opts = {} },
		{ 'folke/neodev.nvim',                opts = {} },
		{ 'stevearc/conform.nvim' },
	},
	config = function()
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
			nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
			nmap('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
			nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
			nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
			nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')
			nmap('<leader>dt', require('telescope.builtin').lsp_type_definitions, '[T]ype Definition')
			nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
		end

		require('conform').setup({
			notify_on_error = true,
			format_on_save = function(bufnr) -- noqa
				return {
					timeout = 500,
				}
			end,
			formatters_by_ft = {
				python = { 'isort' },
			},
		})

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

			--Debug pylsp settings with the following command:
			--	enew|put=execute(\"lua print(vim.inspect(vim.lspo.get_active_clients({name='pylsp'})))\")
			--	[[ Issues attaching pylsp ]]
			--	https://github.com/nicolargo/glances/issues/2246
			--  "[...] solving this by going into my site-packages directory and renaming ujson.cpython-310-x86_64-linux-gnu.so to ujson.so"
			pylsp = {
				pylsp = {
					plugins = {
						flake8 = {
							enabled = false,
						},
						pyflakes = {
							enabled = false,
						},
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

			-- pyright = {
			-- 	pyright = {
			-- 	},
			-- },

			-- ruff_lsp = {
			-- 	ruff = {
			-- 		lineLength = 120
			-- 	},
			-- },

			-- Configuring Java for nvim is proving to be challenging
			--	see: https://github.com/mfussenegger/nvim-jdtls
			--java_language_server = {
			--	Java = {
			--		workspace = { checkThirdParty = false },
			--		telemetry = { enable = false },
			--	}
			--},

			jsonls = {
				jsonls = {
				},
			},

			sqlls = {
				sqlls = {
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

		-- [[ LSP Attach to Buffer ]]
		-- Must define a unique buffer name so multiple buffers can attach at the same time
		local augroups = {}
		local get_augroup = function(client)
			if not augroups[client.id] then
				local name = 'UserLspAttach' .. client.name
				local id = vim.api.nvim_create_augroup(name, { clear = true })
				augroups[client.id] = id
			end
			return augroups[client.id]
		end

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
			callback = function(args)
				local client_id = args.data.client_id
				local client = vim.lsp.get_client_by_id(client_id)
				local bufnr = args.buf
				if not client.server_capabilities.documentFormattingProvider then
					return
				end

				vim.api.nvim_create_autocmd('BufWritePre', {
					group = get_augroup(client),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format {
							async = false,
							filter = function(c)
								return c.id == client.id
							end
						}
					end
				})
			end
		})
	end
}
