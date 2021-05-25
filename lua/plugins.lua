vim.cmd('packadd packer.nvim')


return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
    use 'folke/tokyonight.nvim'
    use 'morhetz/gruvbox'
    use 'glepnir/lspsaga.nvim'

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- use { 'folke/lsp-colors.nvim' }
    -- use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
    use { 'romgrk/barbar.nvim', require = 'kyazdani42/nvim-web-devicons' }

    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }
    -- use { 'hrsh7th/nvim-compe' }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-surround' }
    use { 'airblade/vim-rooter' }
    use { 'ntpeters/vim-better-whitespace' }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = require("custom.evilline"),
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
end)
