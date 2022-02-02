vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }
    use { 'camspiers/snap', rocks = {'fzy'}}

    -- Color schemes
    use { 'folke/tokyonight.nvim' }
    use { 'morhetz/gruvbox' }
    --
    use { 'Th3Whit3Wolf/Dusk-til-Dawn.nvim' }

    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'glepnir/lspsaga.nvim' }
    use { 'glepnir/galaxyline.nvim', branch = 'main' }

    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
    use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' }

    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-unimpaired' }
    use { 'airblade/vim-rooter' }
    use { 'ntpeters/vim-better-whitespace' }
    use { 'numToStr/Comment.nvim' }

end)

