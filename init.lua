--require('highlighter').setup()
require("plugins")
require("setup")
require("custom.telescope")
require("custom.trouble")
require("lsp")
require("custom.cmp")
require("nvim-treesitter")
require("mappings")
-- require("custom.statusline.private_init")
require("comments")
require("custom.gitsigns")
require("flatten").setup({
	window = {
		open = "alternate",
	},
})
require("custom.oil")
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
	disable_insert_on_commit = true,
	kind = "split",
	integrations = {
		telescope = true,
		diffview = true,
	},
	status = {
		recent_commit_count = 20,
	},
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
