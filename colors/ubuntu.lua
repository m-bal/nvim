-- Ubuntu terminal colorscheme for Neovim
-- Based on the official Ubuntu terminal palette (#300A24 background)

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "ubuntu"
vim.o.termguicolors = true
vim.o.background = "dark"

local c = {
  bg        = "#300A24",
  bg_dark   = "#200618",
  bg_sel    = "#4a1a3a",
  fg        = "#EEEEEC",
  comment   = "#AD7FA8",  -- bright magenta / muted
  black     = "#2E3436",
  red       = "#CC0000",
  green     = "#4E9A06",
  yellow    = "#C4A000",
  blue      = "#3465A4",
  magenta   = "#75507B",
  cyan      = "#06989A",
  white     = "#D3D7CF",
  br_black  = "#555753",
  br_red    = "#EF2929",
  br_green  = "#8AE234",
  br_yellow = "#FCE94F",
  br_blue   = "#729FCF",
  br_mag    = "#AD7FA8",
  br_cyan   = "#34E2E2",
  br_white  = "#EEEEEC",
}

local hl = vim.api.nvim_set_hl
hl(0, "Normal",       { fg = c.fg,       bg = c.bg })
hl(0, "NormalFloat",  { fg = c.fg,       bg = c.bg_dark })
hl(0, "Comment",      { fg = c.comment,  italic = true })
hl(0, "Keyword",      { fg = c.br_blue,  bold = true })
hl(0, "Function",     { fg = c.br_green })
hl(0, "String",       { fg = c.br_yellow })
hl(0, "Number",       { fg = c.br_red })
hl(0, "Boolean",      { fg = c.br_red })
hl(0, "Constant",     { fg = c.br_mag })
hl(0, "Type",         { fg = c.br_cyan })
hl(0, "Identifier",   { fg = c.fg })
hl(0, "Statement",    { fg = c.br_blue,  bold = true })
hl(0, "PreProc",      { fg = c.cyan })
hl(0, "Special",      { fg = c.br_mag })
hl(0, "Operator",     { fg = c.white })
hl(0, "Delimiter",    { fg = c.white })
hl(0, "Error",        { fg = c.br_red,   bold = true })
hl(0, "Todo",         { fg = c.bg,       bg = c.br_yellow, bold = true })

hl(0, "LineNr",       { fg = c.br_black })
hl(0, "CursorLine",   { bg = c.bg_sel })
hl(0, "CursorLineNr", { fg = c.br_yellow, bold = true })
hl(0, "CursorColumn", { bg = c.bg_sel })
hl(0, "ColorColumn",  { bg = c.bg_dark })
hl(0, "SignColumn",   { fg = c.br_black, bg = c.bg })
hl(0, "VertSplit",    { fg = c.magenta })
hl(0, "WinSeparator", { fg = c.magenta })

hl(0, "Visual",       { bg = c.bg_sel })
hl(0, "Search",       { fg = c.bg,  bg = c.br_yellow })
hl(0, "IncSearch",    { fg = c.bg,  bg = c.br_red })
hl(0, "MatchParen",   { fg = c.br_yellow, bold = true })

hl(0, "Pmenu",        { fg = c.fg,    bg = c.bg_dark })
hl(0, "PmenuSel",     { fg = c.bg,    bg = c.br_blue })
hl(0, "PmenuSbar",    { bg = c.bg_sel })
hl(0, "PmenuThumb",   { bg = c.magenta })

hl(0, "StatusLine",   { fg = c.fg,    bg = c.bg_dark })
hl(0, "StatusLineNC", { fg = c.br_black, bg = c.bg_dark })
hl(0, "TabLine",      { fg = c.br_black, bg = c.bg_dark })
hl(0, "TabLineSel",   { fg = c.fg,    bg = c.bg })
hl(0, "TabLineFill",  { bg = c.bg_dark })

hl(0, "DiagnosticError", { fg = c.br_red })
hl(0, "DiagnosticWarn",  { fg = c.br_yellow })
hl(0, "DiagnosticInfo",  { fg = c.br_blue })
hl(0, "DiagnosticHint",  { fg = c.br_cyan })

-- Treesitter
hl(0, "@keyword",         { fg = c.br_blue, bold = true })
hl(0, "@function",        { fg = c.br_green })
hl(0, "@function.call",   { fg = c.green })
hl(0, "@method",          { fg = c.br_green })
hl(0, "@string",          { fg = c.br_yellow })
hl(0, "@number",          { fg = c.br_red })
hl(0, "@boolean",         { fg = c.br_red })
hl(0, "@type",            { fg = c.br_cyan })
hl(0, "@variable",        { fg = c.fg })
hl(0, "@parameter",       { fg = c.white })
hl(0, "@comment",         { fg = c.comment, italic = true })
hl(0, "@constant",        { fg = c.br_mag })
hl(0, "@operator",        { fg = c.white })
hl(0, "@punctuation",     { fg = c.white })
