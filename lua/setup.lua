-- vim.cmd[[colorscheme vim-monokai-tasty]]
-- vim.cmd[[colorscheme monokai_pro]]
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme kanagawa]]
-- vim.cmd[[colorscheme NeoSolarized]]
-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[colorscheme onedark]]
-- vim.cmd[[colorscheme ayu-dark]]
vim.g.tokyonight_style = "night"
vim.g.vem_tabline_show=1
vim.g.vem_tabline_multiwindow_mode=1
vim.g.vem_tabline_show_number='index'
vim.g.vem_tabline_show_icon=0
-- vim.g.ayu_overrides = {
--     IncSearch = {bg = '#cccccc'},
-- }

vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.background = 'dark'
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.opt.foldenable = false
vim.opt.lazyredraw = true
-- vim.o.completeopt = 'menuone,noinsert,noselect'
-- vim.o.menuitems = 50
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.o.showmode = true
vim.o.cmdheight = 2
vim.o.pumblend = 0
vim.o.swapfile = false
vim.g.gruvbox_contrast_dark='light'
vim.g.gruvbox_transparent_bg=false
vim.g.netrw_liststyle = 1
vim.g.netrw_fastbrowse = 0
-- vim.o.statusline=" %f"
-- vim.g.statusline=" %f"
vim.o.termguicolors=true

vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.signcolumn = 'number'
vim.wo.wrap = true
vim.wo.cursorline = false

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
vim.g.wildmenu = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.opt.shellslash = true
vim.o.laststatus = 3

-- vim.g.buftabline_numbers=2
-- vim.g.buftabline_indicators=true

vim.cmd('language en_US.utf-8')

vim.g.termbufm_direction_cmd = 'new'
vim.opt.list=true
vim.opt.listchars={
    eol='﬋',
    tab='>-',
    trail='', 
    nbsp='+',
    space=' ',
    extends='>',
    precedes='<',
}

vim.g.indent_blankline_filetype_exclude = {
'markdown',
'pandoc',
'vimwiki',
'packer',
'tex',
'tsplayground'
}
vim.g.indent_blankline_buftype_exclude = {
'terminal',
'nofile',
'help'
}
-- vim.g.indentLine_char = '▏' -- '│'
-- vim.g.indent_blankline_char = '▏' -- '│'
vim.g.indent_blankline_char = '|'
vim.g.indent_blankline_space_char = ' '
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = true
vim.cmd('highlight IndentBlankLineChar guifg=#f6f6f6 guibg=NONE')
vim.cmd('highlight statusline guifg=#000000')
-- vim.cmd('highlight IndentBlankLineSpaceChar ctermfg=DarkGray ctermbg=NONE cterm=nocombine')



-- Set barbar's options
vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 10,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}


local vimrc_group = vim.api.nvim_create_augroup('vimrc', { clear = true })

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  command = [[setlocal nonumber norelativenumber]],
  group = vimrc_group,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  command = 'setlocal spell',
  group = vimrc_group,
})
