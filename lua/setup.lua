vim.cmd[[colorscheme gruvbox]]

vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showmode = false
vim.o.cmdheight = 2
vim.o.pumblend = 17

vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.signcolumn = 'number'
vim.wo.wrap = false
vim.wo.cursorline = true

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.g.mapleader = ' '
vim.b.mapleader = ' '


vim.cmd('language en_US.utf-8')

vim.g.termbufm_direction_cmd = 'new'
vim.o.listchars= 'tab:>-,trail:·,extends:>,precedes:<'

