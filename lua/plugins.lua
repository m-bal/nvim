vim.cmd("packadd packer.nvim")

return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })

	-- Color schemes
	use({ "fcpg/vim-fahrenheit" })
	use({ "fcpg/vim-farout" })
	use({ "fcpg/vim-orbital" })
	use({ "m-bal/orange" })
	use({ "Mofiqul/dracula.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })

	use({ "glepnir/galaxyline.nvim", branch = "main" })

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-hop.nvim" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })

	use({
		"nvim-treesitter/nvim-treesitter",
		-- commit = '0922634d371d45c344a559119ed398f91e399085',
	})
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "onsails/lspkind-nvim" })
	use({ "hrsh7th/nvim-cmp", commit = "fae808a2bca079ea9454f33cb1e2db81c59e102b" })
	use({ "nvim-telescope/telescope-fzy-native.nvim" })
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-unimpaired" })
	use({ "tpope/vim-endwise" })
	use({ "airblade/vim-rooter" })
	use({ "numToStr/Comment.nvim" })
	use({ "willothy/flatten.nvim" })
	use({ "skamsie/vim-lineletters", commit = "ba16f726cba2c0f7cf4c094408e17a3b605f0cc7" })
	use({
		"stevearc/oil.nvim",
	})
	use({
		"jinh0/eyeliner.nvim",
	})
	use({
		"NeogitOrg/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
	})
	use({ "ray-x/go.nvim" })
end)
