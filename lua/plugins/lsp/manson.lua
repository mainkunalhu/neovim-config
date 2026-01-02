return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"intelephense",
				"ts_ls",
				"eslint",
				"pyright",
				"gopls",
				"rust_analyzer",
				"marksman",
				"clangd",
				"vimls",
				"jsonls",
				"html",
				"cssls",
				"tailwindcss",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},

			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
