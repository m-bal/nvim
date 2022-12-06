vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }
    use { 'camspiers/snap', rocks = {'fzy'}}

    -- Color schemes
    use { 'folke/tokyonight.nvim' }
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'tanvirtin/monokai.nvim' }
    use { 'patstockwell/vim-monokai-tasty' }
    use { 'rmehri01/onenord.nvim' }
    --

    use { 'Th3Whit3Wolf/Dusk-til-Dawn.nvim' }

    -- use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'glepnir/lspsaga.nvim' }
    use { 'glepnir/galaxyline.nvim', branch = 'main' }

    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, { "nvim-telescope/telescope-live-grep-args.nvim" }} }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { 'hrsh7th/cmp-path'}
    use { 'hrsh7th/cmp-cmdline' }
    use { 'onsails/lspkind-nvim' }
    use { 'hrsh7th/nvim-cmp', commit = 'fae808a2bca079ea9454f33cb1e2db81c59e102b'}
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-unimpaired' }
    use { 'airblade/vim-rooter' }
    -- use { 'ntpeters/vim-better-whitespace' }
    use { 'numToStr/Comment.nvim' }
    use { 'folke/which-key.nvim' }
    -- use { 'samjwill/nvim-unception' }
    --
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use {
        'lewis6991/gitsigns.nvim',
        commit = '0f6599720da853a8731fb29e809dd9bab837ba5b',
    }
    use { 'jlanzarotta/bufexplorer' }
    use { 'elihunter173/dirbuf.nvim' }

end)

