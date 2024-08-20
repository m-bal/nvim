return {
	-- Color schemes
	{ "norcalli/nvim-colorizer.lua" },
	{ "EdenEast/nightfox.nvim" },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "tpope/vim-vividchalk" },
	{ "ewilazarus/preto" },
	{ "fcpg/vim-fahrenheit" },
	{ "fcpg/vim-farout" },
	{ "fcpg/vim-orbital" },
	{ "m-bal/orange" },
	{ "Mofiqul/dracula.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{
		"samharju/synthweave.nvim",
	},

	{ "glepnir/galaxyline.nvim", branch = "main" },
	{ "tpope/vim-rsi" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	},
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-hop.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "nvim-tree/nvim-web-devicons" },
	{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

	{
		"nvim-treesitter/nvim-treesitter",
		-- commit = '0922634d371d45c344a559119ed398f91e399085',
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-emoji" },
	{ "onsails/lspkind-nvim" },
	{ "hrsh7th/nvim-cmp", commit = "fae808a2bca079ea9454f33cb1e2db81c59e102b" },
	{ "nvim-telescope/telescope-fzy-native.nvim" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-endwise" },
	-- { "airblade/vim-rooter" },
	{ "ahmedkhalf/project.nvim" },
	{ "numToStr/Comment.nvim" },
	{ "willothy/flatten.nvim" },
	{ "skamsie/vim-lineletters", commit = "ba16f726cba2c0f7cf4c094408e17a3b605f0cc7" },
	{
		"stevearc/oil.nvim",
	},
	{
		"jinh0/eyeliner.nvim",
	},
	{
		"NeogitOrg/neogit",
		-- commit = "b2c96fe2c590f299f47618a791a4abe190ca6467",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
	},
	-- { "ray-x/go.nvim" },
	{ "echasnovski/mini.nvim", version = false },
	{ "echasnovski/mini.trailspace", version = false },
	{ "echasnovski/mini.indentscope", version = false },
	{ "echasnovski/mini.pairs", version = false },
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {},
	},

	{
		"stevearc/overseer.nvim",
		opts = {},
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- Mandatory
			"echasnovski/mini.icons", -- Mandatory
			-- "nvim-tree/nvim-web-devicons", -- Optional but recommended
		},
	},
	{
		"nvim-telekasten/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-telekasten/calendar-vim" },
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			-- Flavour to use when requested without a name suffix.
			flavour = "mocha",
			color_overrides = {
				frappe = {
					-- I prefer an actually-black background
					base = "#000000",
				},
				macchiato = {
					-- I prefer an actually-black background
					base = "#000000",
				},
				mocha = {
					-- I prefer an actually-black background
					base = "#000000",
					mantle = "#2e2e3e",
					crust = "#1e1e2e",
					text = "#dde6f4",
				},
			},
			styles = {
				conditionals = {},
			},
			custom_highlights = function(colors)
				return {
					-- Override the sign column to use the mantle color
					SignColumn = { bg = colors.mantle },
					-- Brighten up the status line on the focused pane.
					StatusLine = { bg = colors.overlay0 },

					-- I like my comments blue to exploit chromostereopsis.
					Comment = { fg = colors.blue },

					-- Weirdly, all signs default to black background by
					-- default. Fix this:
					DiagnosticSignError = { bg = colors.mantle },
					DiagnosticSignWarn = { bg = colors.mantle },
					DiagnosticSignInfo = { bg = colors.mantle },
					DiagnosticSignHint = { bg = colors.mantle },

					-- I like my macros visually set apart from everything else
					-- a bit more than the default, and pink is underused in
					-- the syntax themes.
					Macro = { fg = colors.pink },
					-- Teal sets the strings off from comments well enough for
					-- me, visually.
					String = { fg = colors.teal },
					-- Playing with highlighting constants.
					Constant = { style = { "italic" } },
					-- By default the following things are distinguished by
					-- color; I would prefer that they were mostly not
					-- distinguished.
					["@property"] = { fg = colors.text },
					["@variable.member"] = { link = "@property" },
					Function = {
						-- just colors.text + bold looks a bit too bright
						fg = colors.subtext1,
						style = { "bold" },
					},

					-- I do not need function arguments colored differently
					-- from other variables, thanks.
					["@parameter"] = { link = "@variable" },
					["@variable.parameter"] = { link = "@parameter" },

					-- I do not need "builtin" functions and macros
					-- distinguished from anything else, thank you.
					["@function.builtin"] = { link = "Function" },
					["@lsp.typemod.macro.defaultLibrary"] = { link = "Macro" },

					-- Make macros, and also derive attributes, look like
					-- macros.
					["@function.macro"] = { link = "Macro" },
					["@lsp.type.decorator"] = { link = "Macro" },
					["@lsp.mod.attribute"] = { link = "Macro" },

					-- Disable default italics for module names because I find
					-- it distracting.
					["@module"] = { style = {} },

					-- Make the defining appearance of a variable slightly more
					-- obvious. I'm doing this almost entirely to make closures
					-- stand out, because neither treesitter nor rust-analyzer
					-- give me many classes to go on to achieve this.
					["@lsp.typemod.variable.declaration"] = { fg = colors.green },
					["@lsp.typemod.parameter.declaration"] = { link = "@lsp.typemod.variable.declaration" },

					-- this looks like an oversight upstream.
					["@lsp.mod.constant"] = { link = "Constant" },
					-- Play with highlighting enum members differently from
					-- constants.
					["@lsp.type.enumMember"] = {
						style = { "bold" },
					},
					-- Just use keyword highlighting for self, thanks
					["@lsp.type.selfKeyword"] = { link = "Keyword" },
					["@variable.builtin"] = { link = "Keyword" },
					-- Make ? more obvious.
					["@lsp.typemod.operator.controlFlow"] = {
						fg = colors.red,
						style = { "bold" },
					},
					-- Highlight all appearances of and uses of mutable
					-- bindings. I'm not sure if I like this, I'm messing with
					-- it.
					["@lsp.mod.mutable"] = {
						style = { "underline" },
					},
					["@lsp.typemod.variable.mutable"] = {
						link = "@lsp.mod.mutable",
					},

					["gitcommitSummary"] = { style = { "bold" } },
				}
			end,
			integrations = {
				native_lsp = {
					-- By default catppuccin leaves most underlines as plain
					-- underlines. Since I'm using a modern terminal, I've got
					-- options!
					underlines = {
						-- Red squiggle for errors
						errors = { "undercurl" },
						-- Yellow squiggle for warnings
						warnings = { "undercurl" },
						-- Fine dots for hints and info
						hints = { "underdashed" },
						information = { "underdashed" },
					},
				},
			},
		},
	},
}
