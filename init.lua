vim.g.maplocalleader = ","
vim.g.mapleader = " "
vim.g.maplocalleader = ","
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ { import = "plugins" } })
--require('highlighter').setup()
--require("telekasten").setup({
--	take_over_my_home = false,
--	home = vim.fn.expand("~/notes"),
--	auto_set_filetype = false,
--})
require("custom.telescope")
require("setup")
require("custom.trouble")
require("lsp")
require("colorizer").setup()
require("custom.oil")
require("mappings")
require("custom.cmp")
require("nvim-treesitter").setup({
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
-- require("custom.statusline.private_init")
require("custom.evilline")
require("comments")
require("custom.gitsigns")
require("flatten").setup({
	window = {
		open = "alternate",
	},
})
require("treesitter-context")
-- require("eyeliner").setup({
-- 	highlight_on_key = true, -- show highlights only after keypress
-- 	dim = true, -- dim all other characters if set to true (recommended!)
-- })
-- require("custom.null-ls")
-- require("go").setup()
require("gitsigns").setup()
require("neogit").setup({
	disable_signs = true,
	use_telescope = true,
	-- telescope_sorter = function()
	-- 	return require("telescope").extensions.fzf.native_fzf_sorter()
	-- end,
	graph_style = "unicode",
	disable_insert_on_commit = true,
	kind = "split",
	integrations = {
		telescope = true,
		diffview = true,
	},
	status = {
		recent_commit_count = 30,
	},
})
require("project_nvim").setup({
	detection_methods = { "pattern", "lsp" },
})
-- require("mini.trailspace").setup()
-- require("mini.indentscope").setup()
-- require("mini.pairs").setup()
require("hop").setup({})
-- require("mini.jump2d").setup({
-- 	mappings = {
-- 		start_jumping = ";",
-- 	},
-- 	view = {
-- 		-- Whether to dim lines with at least one jump spot
-- 		dim = false,
--
-- 		-- How many steps ahead to show. Set to big number to show all steps.
-- 		n_steps_ahead = 0,
-- 	},
-- })
-- require("overseer").setup({
-- 	task_list = {
-- 		-- Default detail level for tasks. Can be 1-3.
-- 		default_detail = 1,
-- 		-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
-- 		-- min_width and max_width can be a single value or a list of mixed integer/float types.
-- 		-- max_width = {100, 0.2} means "the lesser of 100 columns or 20% of total"
-- 		max_width = { 100, 0.1 },
-- 		-- min_width = {40, 0.1} means "the greater of 40 columns or 10% of total"
-- 		min_width = { 20, 0.05 },
-- 		-- optionally define an integer/float for the exact width of the task list
-- 		max_height = { 20, 0.1 },
-- 		min_height = 8,
-- 		height = nil,
-- 		-- String that separates tasks
-- 		separator = "────────────────────────────────────────",
-- 		-- Default direction. Can be "left", "right", or "bottom"
-- 		direction = "left",
-- 		-- Set keymap to false to remove default behavior
-- 		-- You can add custom keymaps here as well (anything vim.keymap.set accepts)
-- 		bindings = {
-- 			["?"] = "ShowHelp",
-- 			["g?"] = "ShowHelp",
-- 			["<CR>"] = "RunAction",
-- 			["<C-e>"] = "Edit",
-- 			["o"] = "Open",
-- 			["<C-v>"] = "OpenVsplit",
-- 			["<C-s>"] = "OpenSplit",
-- 			["<C-f>"] = "OpenFloat",
-- 			["<C-q>"] = "OpenQuickFix",
-- 			["p"] = "TogglePreview",
-- 			["<C-l>"] = "IncreaseDetail",
-- 			["<C-h>"] = "DecreaseDetail",
-- 			["L"] = "IncreaseAllDetail",
-- 			["H"] = "DecreaseAllDetail",
-- 			["["] = "DecreaseWidth",
-- 			["]"] = "IncreaseWidth",
-- 			["{"] = "PrevTask",
-- 			["}"] = "NextTask",
-- 			["<C-k>"] = "ScrollOutputUp",
-- 			["<C-j>"] = "ScrollOutputDown",
-- 			["q"] = "Close",
-- 		},
-- 	},
-- 	templates = { "builtin", "py-format", "py-lint" },
-- })

require("render-markdown").setup({
	file_types = { "markdown" },
})
-- require("mason").setup({
-- 	ui = {
-- 		icons = {
-- 			package_installed = "✓",
-- 			package_pending = "➜",
-- 			package_uninstalled = "✗",
-- 		},
-- 	},
-- })
-- require("nvim-tree").setup()
-- require("codecompanion").setup({
-- 	strategies = {
-- 		chat = {
-- 			adapter = "deepseek",
-- 		},
-- 		inline = {
-- 			adapter = "deepseek",
-- 		},
-- 	},
-- 	adapters = {
-- 		deepseek = function()
-- 			return require("codecompanion.adapters").extend("ollama", {
-- 				env = {
-- 					url = "http://localhost:11435",
-- 					chat_url = "/api/generate",
-- 				},
-- 				name = "deepseek-r1", -- Give this adapter a different name to differentiate it from the default ollama adapter
-- 				schema = {
-- 					model = {
-- 						default = "deepseek-r1:14b",
-- 					},
-- 					num_ctx = {
-- 						default = 75000,
-- 					},
-- 					num_predict = {
-- 						default = -1,
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- 	opts = {
-- 		-- Set debug logging
-- 		log_level = "DEBUG",
-- 	},
-- })
require("beacon").setup()
require("scope").setup({})
