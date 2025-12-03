local vim = vim

-- Define capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function
local on_attach = function(client, bufnr)
	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

	-- Mappings.
	local opts = { noremap = true, silent = true }

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format()
end, {})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.diagnostic.on_publish_diagnostics, {
	-- Disable signs
	signs = false,
})

-- Helper function to start LSP
local function start_lsp(name, config)
	local defaults = {
		name = name,
		capabilities = capabilities,
		on_attach = on_attach,
		-- Default root detection
		root_dir = vim.fs.root(0, {
			".git",
			"package.json",
			"go.mod",
			"Cargo.toml",
			"compile_commands.json",
			"setup.py",
			"pyproject.toml",
		}),
	}
	local final_config = vim.tbl_deep_extend("force", defaults, config)
	vim.lsp.start(final_config)
end

-- bashls
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sh", "bats" },
	callback = function()
		start_lsp("bashls", {
			cmd = { "bash-language-server", "start" },
			settings = {
				bashIde = {
					globPattern = "*@(.sh|.inc|.bash|.command|.bats)",
				},
			},
		})
	end,
})

-- pylsp
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		start_lsp("pylsp", {
			cmd = { "pylsp" },
			on_init = function(client)
				if client.server_capabilities then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
			settings = {
				pylsp = {
					plugins = {
						flake8 = { enabled = true },
						pylint = { enabled = true },
						jedi = { environemnt = "python3.9" },
						jedi_completion = { enabled = true },
					},
				},
			},
		})
	end,
})

-- pyright
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		start_lsp("pyright", {
			cmd = { "pyright-langserver", "--stdio" },
			settings = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "strict",
				},
				venvPath = "/home/manvir/miniconda3",
				executionEnvironments = {
					{
						root = "~",
						venv = "~",
						extraPaths = {
							"/home/manvir/miniconda3/lib/python3.12/site-packages",
						},
					},
				},
			},
		})
	end,
})

-- cucumber_language_server
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cucumber", "feature" },
	callback = function()
		start_lsp("cucumber_language_server", {
			cmd = { "cucumber-language-server", "--stdio" },
		})
	end,
})

-- gopls
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "gomod" },
	callback = function()
		start_lsp("gopls", {
			cmd = { "gopls" },
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		})
	end,
})

-- texlab
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex", "bib" },
	callback = function()
		start_lsp("texlab", {
			cmd = { "texlab" },
		})
	end,
})

-- eslint
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function()
		start_lsp("eslint", {
			cmd = { "vscode-eslint-language-server", "--stdio" },
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})
	end,
})

-- ts_ls
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function()
		start_lsp("ts_ls", {
			cmd = { "typescript-language-server", "--stdio" },
		})
	end,
})

-- clangd
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "hpp" },
	callback = function()
		start_lsp("clangd", {
			cmd = {
				"clangd-15",
				"--background-index",
				"--pch-storage=memory",
				"--clang-tidy",
				"--all-scopes-completion=true",
				"--query-driver=/usr/bin/g++",
				"--completion-style=detailed",
				"--compile-commands-dir=./builds/dbg-x86",
				"--enable-config",
				"--header-insertion=iwyu",
				"-j=10",
			},
		})
	end,
})

-- rust_analyzer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		start_lsp("rust_analyzer", {
			cmd = { "rust-analyzer" },
			settings = {
				["rust-analyzer"] = {
					cachePriming = {
						numThreads = 4,
					},
					assist = {
						importGranularity = "module",
						importPrefix = "self",
					},
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						loadOutDirsFromCheck = true,
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true,
					},
					check = {
						command = "clippy",
					},
				},
			},
		})
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
	pattern = "*.rs",
	command = 'silent! execute "!cargo fmt"| redraw!',
})