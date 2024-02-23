vim.g.vem_tabline_show = 1
vim.g.vem_tabline_multiwindow_mode = 1
vim.g.vem_tabline_show_number = "index"
vim.g.vem_tabline_show_icon = 0

vim.o.autochdir = true
vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.background = "dark"
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.opt.foldenable = false
vim.opt.lazyredraw = off
vim.o.cmdheight = 2
vim.o.pumblend = 0
vim.o.swapfile = false
vim.g.gruvbox_contrast_dark = "light"
vim.g.gruvbox_transparent_bg = false
vim.g.netrw_liststyle = 1
vim.g.netrw_fastbrowse = 0
vim.o.termguicolors = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "number"
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

vim.g.mapleader = " "
vim.b.mapleader = " "
vim.g.wildmenu = true

vim.opt.conceallevel = 0
vim.opt.concealcursor = "nc"
vim.o.laststatus = 2
-- Disable mouse popup
vim.cmd("set mouse=")

vim.cmd("language en_US.utf-8")

vim.g.termbufm_direction_cmd = "new"
vim.opt.list = true
vim.opt.listchars = {
	eol = "¬",
	tab = "  ",
	trail = " ",
	--trail = "",
	nbsp = "+",
	space = " ",
	extends = " ",
	precedes = " ",
}

-- vim.g.indent_blankline_filetype_exclude = {
-- 	"markdown",
-- 	"pandoc",
-- 	"vimwiki",
-- 	"packer",
-- 	"tex",
-- 	"tsplayground",
-- }
-- vim.g.indent_blankline_buftype_exclude = {
-- 	"terminal",
-- 	"nofile",
-- 	"help",
-- }
-- vim.g.indent_blankline_char = "|"
-- vim.g.indent_blankline_space_char = " "
-- vim.g.indent_blankline_show_first_indent_level = false
-- vim.g.indent_blankline_show_trailing_blankline_indent = false
-- vim.g.indent_blankline_use_treesitter = true
vim.cmd("highlight IndentBlankLineChar guifg=#f6f6f6 guibg=NONE")
-- vim.cmd("highlight statusline guifg=#000000 ctermfg=5")

-- Set cursor color to green

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
	icon_separator_active = "▎",
	icon_separator_inactive = "▎",
	icon_close_tab = "",
	icon_close_tab_modified = "●",
	icon_pinned = "車",

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
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

	-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- where X is the buffer number. But only a static string is accepted here.
	no_name_title = nil,
}

local vimrc_group = vim.api.nvim_create_augroup("vimrc", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = [[setlocal nonumber norelativenumber]],
	group = vimrc_group,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell",
	group = vimrc_group,
})
vim.api.nvim_create_autocmd({ "FileChangedShellPost", "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
vim.api.nvim_create_autocmd(
	{ "FileChangedShellPost" },
	{ command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None', pattern = { "*" } }
)

require("gruvbox").setup({
	overrides = {
		-- Normal = {bg = "#0E1018"},
		Normal = { bg = "NONE" },
		VertSplit = { bg = "#0E1018" },
		SignColumn = { bg = "#ff9900" },
		Define = { link = "GruvboxPurple" },
		Macro = { link = "GruvboxPurple" },
		TSNote = { link = "GruvboxYellow" },
		TSConstBuiltin = { link = "GruvboxPurple" },
		CocCodeLens = { fg = "#878787" },
		ContextVt = { fg = "#878787" },
		Comment = { fg = "#fe8019", italic = true },
		Folded = { italic = true, fg = "#fe8019", bg = "#3c3836" },
		FoldColumn = { fg = "#fe8019", bg = "#0E1018" },
		CocRustTypeHint = { fg = "#87afaf", bg = "#0E1018" },
		CocRustChainingHint = { fg = "#87afaf", bg = "#0E1018" },
		DiffAdd = { bold = true, reverse = false, fg = "", bg = "#2a4333" },
		DiffChange = { bold = true, reverse = false, fg = "", bg = "#333841" },
		DiffDelete = {
			bold = true,
			reverse = false,
			fg = "#442d30",
			bg = "#442d30",
		},
		DiffText = { bold = true, reverse = false, fg = "", bg = "#213352" },
		StatusLine = { bg = "#ffffff", fg = "#0E1018" },
		StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
		CursorLineNr = { fg = "#fabd2f", bg = "#0E1018" },
		CocWarningFloat = { fg = "#dfaf87" },
		GruvboxOrangeSign = { fg = "#dfaf87", bg = "#0E1018" },
		GruvboxAquaSign = { fg = "#8EC07C", bg = "#0E1018" },
		GruvboxGreenSign = { fg = "#b8bb26", bg = "#0E1018" },
		GruvboxRedSign = { fg = "#fb4934", bg = "#0E1018" },
		GruvboxBlueSign = { fg = "#83a598", bg = "#0E1018" },
		WilderMenu = { fg = "#ebdbb2", bg = "#0E1018" },
		WilderAccent = { fg = "#f4468f", bg = "#0E1018" },
	},
})
require("dracula").setup({
	-- customize dracula color palette
	colors = {
		bg = "#282A36",
		fg = "#F8F8F2",
		selection = "#44475A",
		comment = "#6272A4",
		red = "#FF5555",
		orange = "#FFB86C",
		yellow = "#F1FA8C",
		green = "#50fa7b",
		purple = "#BD93F9",
		cyan = "#8BE9FD",
		pink = "#FF79C6",
		bright_red = "#FF6E6E",
		bright_green = "#69FF94",
		bright_yellow = "#FFFFA5",
		bright_blue = "#D6ACFF",
		bright_magenta = "#FF92DF",
		bright_cyan = "#A4FFFF",
		bright_white = "#FFFFFF",
		menu = "#21222C",
		visual = "#3E4452",
		gutter_fg = "#4B5263",
		nontext = "#3B4048",
	},
	-- show the '~' characters after the end of buffers
	show_end_of_buffer = true, -- default false
	-- use transparent background
	transparent_bg = true, -- default false
	-- set custom lualine background color
	lualine_bg_color = "#44475a", -- default nil
	-- set italic comment
	italic_comment = true, -- default false
	-- overrides the default highlights see `:h synIDattr`
	overrides = {
		-- Examples
		-- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
		-- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
		-- Nothing = {} -- clear highlight of Nothing
	},
})
-- vim.cmd([[colorscheme dracula]])
-- vim.cmd([[colorscheme wildcharm]])
-- vim.cmd([[colorscheme desert]])
--
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme darkblue]])
-- vim.cmd([[colorscheme farout]])
-- vim.cmd([[colorscheme elflord]])
vim.cmd([[colorscheme vim]])
-- vim.cmd([[colorscheme orbital]])
-- vim.cmd([[colorscheme preto]])
vim.cmd([[command! G Neogit]])
vim.cmd("highlight Cursor guifg=black guibg=red")
vim.cmd("highlight MatchParen guifg=black guibg=red")
vim.cmd("highlight Cursor2 guifg=green guibg=green")
vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50")
-- vim.cmd([[colorscheme elflord]])
-- vim.cmd([[colorscheme github_light]])

-- vim.cmd('set rtp+=~/Projects/highlighter')
