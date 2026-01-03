return {
	{
		"williamboman/mason.nvim",
		opts = { ui = { border = "rounded" } },
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				float = { border = "rounded", source = "always" },
			})

			local servers = {
				lua_ls = {
					settings = { Lua = { diagnostics = { globals = { "vim" } } } },
				},
				ts_ls = {
					settings = {
						completions = { completeFunctionCalls = true },
						typescript = { suggest = { autoImports = true } },
					},
				},
				eslint = {},
				pyright = {},
				gopls = {},
				rust_analyzer = {},
				tailwindcss = {},
				html = {},
				cssls = {},
			}

			mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				-- Modern 0.12/0.11 native enable
				if vim.lsp.config then
					vim.lsp.config(server, config)
					vim.lsp.enable(server)
				else
					-- Fallback for older nvim-lspconfig versions
					require("lspconfig")[server].setup(config)
				end
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = { "prettier", "stylua", "eslint_d" },
		},
	},
}
