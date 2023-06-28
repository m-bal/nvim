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
        width = vim.api.nvim_win_get_width(0) - 80,
        height = vim.api.nvim_win_get_height(0) - 30,
    },
})
require('flatten').setup({
    window = {
        open = 'alternate',
    }
})
require('custom.oil')
require('treesitter-context')
require('eyeliner').setup {
  highlight_on_key = true, -- show highlights only after keypress
  dim = true              -- dim all other characters if set to true (recommended!)
}
