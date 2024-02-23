vim.g.mapleader = " "
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
require("custom.oil")
require("mappings")
require("custom.cmp")
require("nvim-treesitter")
--require("custom.statusline.private_init")
require("custom.evilline")
require("comments")
require("custom.gitsigns")
require("flatten").setup({
	window = {
		open = "alternate",
	},
})
require("treesitter-context")
require("eyeliner").setup({
	highlight_on_key = true, -- show highlights only after keypress
	dim = true, -- dim all other characters if set to true (recommended!)
})
require("custom.null-ls")
require("go").setup()
require("neogit").setup({
	disable_signs = true,
	use_telescope = true,
	telescope_sorter = function()
		return require("telescope").extensions.fzf.native_fzf_sorter()
	end,
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
require("mini.trailspace").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
require("overseer").setup({
	templates = { "builtin", "py-format", "py-lint" },
})
-- require( 'neorg' ).setup {
--     load = {
--         ["core.defaults"] = {},
--         ["core.ui"] = {},
--         ["core.highlights"] = {
--             config = {
--                 highlights = {
--                     headings = {
--                         ["1"] = {
--                             title = "+TSTitle",
--                             prefix = "+TSTitle",
--                         },
--                     },
--                     quotes = {
--                         ["1"] = {
--                             prefix = "+Grey",
--                             content = "+Grey",
--                         },
--                     },
--                 },
--             },
--         },
--         ["core.keybinds"] = {
--             config = {
--                 defaults_keybinds = true,
--                 neorg_leader = "<Leader>o"
--             }
--         },
--         ["core.concealer"] = {},
--         ["core.completion"] = {
--             config = {
--                 engine = "nvim-cmp",
--             },
--         },
--         ["core.dirman"] = {
--             config = {
--                 workspaces = {
--                     org = "~/Org",
--                 },
--                 autodetect = true,
--                 autochdir = true,
--             },
--         },
--         -- ["core.norg.esupports.metagen"] = {
--         --     config = {
--         --         type = "<leader>om",
--         --     },
--         -- },
--         ["core.presenter"] = {
--             config = {
--                 zen_mode = "zen-mode",
--             }
--         },
--         ["core.qol.toc"] = {},
--         -- ["core.export"] = {},
--         -- ["core.export.markdown"] = {
--         --     config = {
--         --         extensions = "all",
--         --     },
--         -- },
--         ["core.ui.calendar"] = {},
--     },
--
