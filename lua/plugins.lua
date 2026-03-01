return {
	-- Color schemes
    { "trusktr/seti.vim" },
    {
      "hyperb1iss/silkcircuit-nvim",
      lazy = false,
      priority = 1000,
    },
    { 'eemed/sitruuna.vim' },
    {
        "jackplus-xyz/binary.nvim",
        opts = {
            -- Add your configuration here
            style= "dark",
            -- colors = {
            --   fg = "#0049C6",
            --   bg = "#ffffff",
            -- },
            -- colors = {
            --   fg = "#2CF180",
            --   bg = "#0E1F12",
            -- }
            colors = {
                fg = "#000000",
                bg = "#ffffff",
            },
        }
    },
	-- { "norcalli/nvim-colorizer.lua" },
	{ "EdenEast/nightfox.nvim" },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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

	-- { "danilamihailov/beacon.nvim" }, -- lazy calls setup() by itself
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
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-emoji" },
	{ "onsails/lspkind-nvim" },
	{ "hrsh7th/nvim-cmp" },
	{ "nvim-telescope/telescope-fzy-native.nvim" },
	-- { "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-endwise" },
	{ "airblade/vim-rooter" },
	-- { "ahmedkhalf/project.nvim" },
	{ "numToStr/Comment.nvim" },
	{ "willothy/flatten.nvim" },
	{ "skamsie/vim-lineletters", commit = "ba16f726cba2c0f7cf4c094408e17a3b605f0cc7" },
	{
		"stevearc/oil.nvim",
	},
	-- {
	-- 	"jinh0/eyeliner.nvim",
	-- },
	{ "lewis6991/gitsigns.nvim" },
	{
		"NeogitOrg/neogit",
		-- commit = "b2c96fe2c590f299f47618a791a4abe190ca6467",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
	},
	-- { "ray-x/go.nvim" },
	-- { "echasnovski/mini.nvim", version = false },
	-- { "echasnovski/mini.trailspace", version = false },
	-- { "echasnovski/mini.indentscope", version = false },
	-- { "echasnovski/mini.pairs", version = false },
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {},
	},

	-- {
	-- 	"stevearc/overseer.nvim",
	-- 	opts = {},
	-- },
	-- {
	-- 	"MeanderingProgrammer/markdown.nvim",
	-- 	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter", -- Mandatory
	-- 		"echasnovski/mini.icons", -- Mandatory
	-- 		-- "nvim-tree/nvim-web-devicons", -- Optional but recommended
	-- 	},
	-- },
	{
		"nvim-telekasten/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-telekasten/calendar-vim" },
	},
	-- {
	-- 	"MagicDuck/grug-far.nvim",
	-- 	config = function()
	-- 		require("grug-far").setup({
	-- 			-- options, see Configuration section below
	-- 			-- there are no required options atm
	-- 			-- engine = 'ripgrep' is default, but 'astgrep' can be specified
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"williamboman/mason.nvim",
	-- },
	{ "rhysd/vim-grammarous" },
	{ "nvim-tree/nvim-tree.lua" },
	-- {
	-- 	"julienvincent/hunk.nvim",
	-- 	cmd = { "DiffEditor" },
	-- 	config = function()
	-- 		require("hunk").setup()
	-- 	end,
	-- },
	{ "tiagovla/scope.nvim", config = true },
    -- Lua

    {
      'rmagatti/auto-session',
      lazy = false,
      keys = {
        -- Will use Telescope if installed or a vim.ui.select picker otherwise
        { '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
        { '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
        { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
      },

      ---enables autocomplete for opts
      ---@module "auto-session"
      ---@type AutoSession.Config
      opts = {
        use_git_branch = true,
        auto_save = false,
        auto_restore = false,
        show_auto_restore_notif = true,
        suppressed_dirs = { '~/', '/' },
        cwd_change_handling = true,
      }
    },
    { 'rafikdraoui/jj-diffconflicts' },
    { 
        'folke/snacks.nvim',
        win = { style = "terminal" },
    },
    {
      'nickjvandyke/opencode.nvim',
      version = "*", -- Latest stable release
      dependencies = {
        {
          -- `snacks.nvim` integration is recommended, but optional
          ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
          "folke/snacks.nvim",
          optional = true,
          opts = {
            input = {}, -- Enhances `ask()`
            picker = { -- Enhances `select()`
              actions = {
                opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
              },
              win = {
                input = {
                  keys = {
                    ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                  },
                },
              },
            },
          },
        },
      },
      config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
          -- Your configuration, if any; goto definition on the type or field for details
        }

        vim.o.autoread = true -- Required for `opts.events.reload`

        -- Recommended/example keymaps
        vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
        vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

        vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
        vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

        vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
        vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

        -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
        vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
        vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
      end,
    },
}
