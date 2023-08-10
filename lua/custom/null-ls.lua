local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- adding new sources requires a restart
	sources = {
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.diagnostics.staticcheck,
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.stylua.with({
			extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/lua/formatter/stylua.toml") },
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})