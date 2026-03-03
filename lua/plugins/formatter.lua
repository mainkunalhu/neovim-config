return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			javascript = { "prettier", "eslint_d" },
			typescript = { "prettier", "eslint_d" },
			javascriptreact = { "prettier", "eslint_d" },
			typescriptreact = { "prettier", "eslint_d" },
			lua = { "stylua" },
			markdown = { "prettier" },
			mdx = { "prettier" },
			python = { "ruff_format", "ruff_fix" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 3000,
		},
	},
}
