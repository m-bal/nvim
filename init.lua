require('plugins')
require('setup')
require('custom.telescope')
require('custom.trouble')
require('lsp')
require('custom.cmp')
require('nvim-treesitter')
require('mappings')
require('custom.statusline.private_init')
require('comments')
require('custom.gitsigns')
require('highlighter')
require('harpoon').setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 100,
        height = vim.api.nvim_win_get_height(0) - 50,
    }
})
require('flatten').setup({
    window = {
        open = 'alternate',
    }
})
