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
require("custom.evilline")
require("comments")
require("custom.gitsigns")
require("flatten").setup({
	window = {
		open = "alternate",
	},
})
require("treesitter-context")
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
require("hop").setup({})

require("render-markdown").setup({
	file_types = { "markdown" },
})
require("beacon").setup()
require("scope").setup({})
