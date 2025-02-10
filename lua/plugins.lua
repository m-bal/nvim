return {
	-- Color schemes
	{ "norcalli/nvim-colorizer.lua" },
	{ "EdenEast/nightfox.nvim" },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"theamallalgi/zitchdog",
		lazy = false,
		priority = 1000,
		commit = "d0c89ca586073724916e2ab95e613f5da6d6a50c",
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
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

	{ "danilamihailov/beacon.nvim" }, -- lazy calls setup() by itself
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
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				-- options, see Configuration section below
				-- there are no required options atm
				-- engine = 'ripgrep' is default, but 'astgrep' can be specified
			})
		end,
	},
	{
		"williamboman/mason.nvim",
	},
	{ "rhysd/vim-grammarous" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		"julienvincent/hunk.nvim",
		cmd = { "DiffEditor" },
		config = function()
			require("hunk").setup()
		end,
	},
	{ "tiagovla/scope.nvim", config = true },

	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = true,
	-- },
}
