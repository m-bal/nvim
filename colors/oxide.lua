-- Name:         vim
-- Description:  Vim's default color scheme
-- Author:       Bram Moolenaar <Bram@vim.org>
-- Maintainer:   The Vim Project <https://github.com/vim/vim>
-- Website:      https://github.com/vim/vim
-- License:      Same as Vim
-- Last Updated: 2023 Aug 10

-- This is Vim's default color scheme. It doesn't define the Normal
-- highlighting, it uses whatever the colors used to be.

vim.cmd.highlight("clear")
vim.g.colors_name = "oxide"

local hi = function(name, val)
	-- Force links
	val.force = true

	-- Make sure that `cterm` attribute is not populated from `gui`
	val.cterm = val.cterm or {}

	-- Define global highlight
	vim.api.nvim_set_hl(0, name, val)
end

--stylua: ignore start
-- General
hi('Normal', { bg = '#080D0E' })

hi('Conceal',      { fg = 'LightGrey', bg = 'DarkGrey', ctermfg = 'LightGrey', ctermbg = 'DarkGrey' })
hi('Cursor',       {})
hi('lCursor',      {})
hi('DiffText',     { bg = 'Red', bold = true,           ctermbg = 'Red', cterm = { bold = true } })
hi('ErrorMsg',     { fg = 'White', bg = 'Red',          ctermfg = 'White', ctermbg = 'DarkRed' })
hi('IncSearch',    { reverse = true,                    cterm = { reverse = true } })
hi('ModeMsg',      { bold = true,                       cterm = { bold = true } })
hi('NonText',      { fg = 'Blue', bold = true,          ctermfg = 'Blue' })
hi('PmenuSbar',    { bg = 'Grey',                       ctermbg = 'Grey' })
hi('StatusLine',   { reverse = true, bold = true,       cterm = { reverse = true, bold = true }})
hi('StatusLineNC', { reverse = true,                    cterm = { reverse = true } })
hi('TabLineFill',  { reverse = true,                    cterm = { reverse = true } })
hi('TabLineSel',   { bold = true,                       cterm = { bold = true } })
hi('TermCursor',   { reverse = true,                    cterm = { reverse = true } })
hi('WinBar',       { bold = true,                       cterm = { bold = true } })
hi('WildMenu',     { fg = 'Black', bg = 'Yellow',       ctermfg = 'Black', ctermbg = 'Yellow' })

hi('VertSplit',      { link = 'Normal' })
hi('WinSeparator',   { link = 'VertSplit' })
hi('WinBarNC',       { link = 'WinBar' })
hi('EndOfBuffer',    { link = 'NonText' })
hi('LineNrAbove',    { link = 'LineNr' })
hi('LineNrBelow',    { link = 'LineNr' })
hi('QuickFixLine',   { link = 'Search' })
hi('CursorLineSign', { link = 'SignColumn' })
hi('CursorLineFold', { link = 'FoldColumn' })
hi('CurSearch',      { link = 'Search' })
hi('PmenuKind',      { link = 'Pmenu' })
hi('PmenuKindSel',   { link = 'PmenuSel' })
hi('PmenuExtra',     { link = 'Pmenu' })
hi('PmenuExtraSel',  { link = 'PmenuSel' })
hi('Substitute',     { link = 'Search' })
hi('Whitespace',     { link = 'NonText' })
hi('MsgSeparator',   { link = 'StatusLine' })
hi('NormalFloat',    { link = 'Pmenu' })
hi('FloatBorder',    { link = 'WinSeparator' })
hi('FloatTitle',     { link = 'Title' })
hi('FloatFooter',    { link = 'Title' })

hi('FloatShadow',          { bg = 'Black', blend=80 })
hi('FloatShadowThrough',   { bg = 'Black', blend=100 })
hi('RedrawDebugNormal',    { reverse = true,             cterm = { reverse = true } })
hi('RedrawDebugClear',     { bg = 'Yellow',              ctermbg = 'Yellow' })
hi('RedrawDebugComposed',  { bg = 'Green',               ctermbg = 'Green' })
hi('RedrawDebugRecompose', { bg = 'Red',                 ctermbg = 'Red' })
hi('Error',                { fg = 'White', bg = 'Red',   ctermfg = 'White', ctermbg = 'Red' })
hi('Todo',                 { fg = 'Blue', bg = 'Yellow', ctermfg = 'Black', ctermbg = 'Yellow' })

hi('Character',      { link = 'String' })
hi('Number',         { link = 'Constant' })
hi('Boolean',        { link = 'Constant' })
hi('Float',          { link = 'Number' })
hi('Conditional',    { link = 'Statement' })
hi('Repeat',         { link = 'Statement' })
hi('Label',          { link = 'Statement' })
hi('Operator',       { link = 'Statement' })
hi('Keyword',        { link = 'Statement' })
hi('Exception',      { link = 'Statement' })
hi('Include',        { link = 'Keyword' })
hi('Define',         { link = 'PreProc' })
hi('Macro',          { link = 'PreProc' })
hi('PreCondit',      { link = 'PreProc' })
hi('StorageClass',   { link = 'Type' })
hi('Structure',      { link = 'Type' })
hi('Typedef',        { link = 'Type' })
hi('Tag',            { link = 'Special' })
hi('SpecialChar',    { link = 'Special' })
hi('Delimiter',      { link = 'Special' })
hi('SpecialComment', { link = 'Special' })
hi('Debug',          { link = 'Special' })

hi('DiagnosticError',            { fg = 'Red',                          ctermfg = 1 })
hi('DiagnosticWarn',             { fg = 'Orange',                       ctermfg = 3 })
hi('DiagnosticInfo',             { fg = 'LightBlue',                    ctermfg = 4 })
hi('DiagnosticHint',             { fg = 'LightGrey',                    ctermfg = 7 })
hi('DiagnosticOk',               { fg = 'LightGreen',                   ctermfg = 10 })
hi('DiagnosticUnderlineError',   { sp = 'Red', underline = true,        cterm = { underline = true } })
hi('DiagnosticUnderlineWarn',    { sp = 'Orange', underline = true,     cterm = { underline = true } })
hi('DiagnosticUnderlineInfo',    { sp = 'LightBlue', underline = true,  cterm = { underline = true } })
hi('DiagnosticUnderlineHint',    { sp = 'LightGrey', underline = true,  cterm = { underline = true } })
hi('DiagnosticUnderlineOk',      { sp = 'LightGreen', underline = true, cterm = { underline = true } })
hi('DiagnosticVirtualTextError', { link = 'DiagnosticError' })
hi('DiagnosticVirtualTextWarn',  { link = 'DiagnosticWarn' })
hi('DiagnosticVirtualTextInfo',  { link = 'DiagnosticInfo' })
hi('DiagnosticVirtualTextHint',  { link = 'DiagnosticHint' })
hi('DiagnosticVirtualTextOk',    { link = 'DiagnosticOk' })
hi('DiagnosticFloatingError',    { link = 'DiagnosticError' })
hi('DiagnosticFloatingWarn',     { link = 'DiagnosticWarn' })
hi('DiagnosticFloatingInfo',     { link = 'DiagnosticInfo' })
hi('DiagnosticFloatingHint',     { link = 'DiagnosticHint' })
hi('DiagnosticFloatingOk',       { link = 'DiagnosticOk' })
hi('DiagnosticSignError',        { link = 'DiagnosticError' })
hi('DiagnosticSignWarn',         { link = 'DiagnosticWarn' })
hi('DiagnosticSignInfo',         { link = 'DiagnosticInfo' })
hi('DiagnosticSignHint',         { link = 'DiagnosticHint' })
hi('DiagnosticSignOk',           { link = 'DiagnosticOk' })
hi('DiagnosticDeprecated',       { sp = 'Red', strikethrough = true,    cterm = { strikethrough = true } })

hi('DiagnosticUnnecessary', { link = 'Comment' })
hi('LspInlayHint',          { link = 'NonText' })
hi('SnippetTabstop',        { link = 'Visual' })

-- Text
hi('@markup.raw',       { link = 'Comment' })
hi('@markup.link',      { link = 'Identifier' })
hi('@markup.heading',   { link = 'Title' })
hi('@markup.link.url',  { link = 'Underlined' })
hi('@markup.underline', { link = 'Underlined' })
hi('@comment.todo',     { link = 'Todo' })

-- Miscs
hi('@comment',     { link = 'Comment' })
hi('@punctuation', { link = 'Delimiter' })

-- Constants
hi('@constant',          { link = 'Constant' })
hi('@constant.builtin',  { link = 'Special' })
hi('@constant.macro',    { link = 'Define' })
hi('@keyword.directive', { link = 'Define' })
hi('@string',            { link = 'String' })
hi('@string.escape',     { link = 'SpecialChar' })
hi('@string.special',    { link = 'SpecialChar' })
hi('@character',         { link = 'Character' })
hi('@character.special', { link = 'SpecialChar' })
hi('@number',            { link = 'Number' })
hi('@boolean',           { link = 'Boolean' })
hi('@number.float',      { link = 'Float' })

-- Functions
hi('@function',           { link = 'Function' })
hi('@function.builtin',   { link = 'Special' })
hi('@function.macro',     { link = 'Macro' })
hi('@variable.parameter', { link = 'Text' })
hi('@function.method',    { link = 'Function' })
hi('@variable.member',    { link = 'Identifier' })
hi('@property',           { link = 'Identifier' })
hi('@constructor',        { link = 'Special' })

-- Keywords
hi('@keyword.conditional', { link = 'Conditional' })
hi('@keyword.repeat',      { link = 'Repeat' })
hi('@label',               { link = 'Label' })
hi('@operator',            { link = 'Operator' })
hi('@keyword',             { link = 'Keyword' })
hi('@keyword.exception',   { link = 'Exception' })

hi('@variable',          { link = 'Identifier' })
hi('@type',              { link = 'Type' })
hi('@type.definition',   { link = 'Typedef' })
hi('@keyword.storage',   { link = 'StorageClass' })
hi('@module',            { link = 'Identifier' })
hi('@keyword.import',    { link = 'Include' })
hi('@keyword.directive', { link = 'PreProc' })
hi('@keyword.debug',     { link = 'Debug' })
hi('@tag',               { link = 'Tag' })

-- LSP semantic tokens
hi('@lsp.type.class',         { link = 'Structure' })
hi('@lsp.type.comment',       { link = 'Comment' })
hi('@lsp.type.decorator',     { link = 'Function' })
hi('@lsp.type.enum',          { link = 'Structure' })
hi('@lsp.type.enumMember',    { link = 'Constant' })
hi('@lsp.type.function',      { link = 'Function' })
hi('@lsp.type.interface',     { link = 'Structure' })
hi('@lsp.type.macro',         { link = 'Macro' })
hi('@lsp.type.method',        { link = 'Function' })
hi('@lsp.type.namespace',     { link = 'Structure' })
hi('@lsp.type.parameter',     { link = 'Text' })
hi('@lsp.type.property',      { link = 'Text' })
hi('@lsp.type.struct',        { link = 'Structure' })
hi('@lsp.type.type',          { link = 'Type' })
hi('@lsp.type.typeParameter', { link = 'Text' })
hi('@lsp.type.variable',      { link = 'Identifier' })

if vim.o.background == 'light' then
else
  -- Default colors only used with a dark background.
  hi('ColorColumn',  { bg = 'DarkRed',                            ctermbg = 'DarkRed' })
  hi('CursorColumn', { bg = 'Grey40',                             ctermbg = 'DarkGrey' })
  hi('CursorLine',   { bg = 'Grey40',                             cterm = { underline = true } })
  hi('CursorLineNr', { fg = 'Yellow', bold = true,                ctermfg = 'Yellow', cterm = { underline = true } })
  hi('DiffAdd',      { bg = 'DarkBlue',                           ctermbg = 'DarkBlue' })
  hi('DiffChange',   { bg = 'DarkMagenta',                        ctermbg = 'DarkMagenta' })
  hi('DiffDelete',   { fg = 'Blue', bg = 'DarkCyan', bold = true, ctermfg = 'Blue', ctermbg = 'DarkCyan' })
  hi('Directory',    { fg = 'Cyan',                               ctermfg = 'LightCyan' })
  hi('FoldColumn',   { fg = 'Cyan', bg = 'Grey',                  ctermfg = 'Cyan', ctermbg = 'DarkGrey' })
  hi('Folded',       { fg = 'Cyan', bg = 'DarkGrey',              ctermfg = 'Cyan', ctermbg = 'DarkGrey' })
  hi('LineNr',       { fg = 'Yellow',                             ctermfg = 'Yellow' })
  hi('MatchParen',   { bg = 'DarkCyan',                           ctermbg = 'DarkCyan' })
  hi('MoreMsg',      { fg = 'SeaGreen', bold = true,              ctermfg = 'LightGreen' })
  hi('Pmenu',        { bg = '#080D0E',                            ctermfg = 'Black', ctermbg = 'Magenta' })
  hi('PmenuSel',     { bg = '#48d597',                           ctermfg = 'DarkGrey', ctermbg = 'Black' })
  hi('PmenuThumb',   { bg = '#f1d78f',                              ctermbg = 'White' })
  hi('Question',     { fg = 'Green', bold = true,                 ctermfg = 'LightGreen' })
  hi('Search',       { fg = 'Black', bg = 'Yellow',               ctermfg = 'Black', ctermbg = 'Yellow' })
  hi('SignColumn',   { fg = 'Cyan', bg = 'Grey',                  ctermfg = 'Cyan', ctermbg = 'DarkGrey' })
  hi('SpecialKey',   { fg = '#7996dd',                               ctermfg = 'LightBlue' })
  hi('SpellBad',     { sp = 'Red', undercurl = true,              ctermbg = 'Red' })
  hi('SpellCap',     { sp = 'Blue', undercurl = true,             ctermbg = 'Blue' })
  hi('SpellLocal',   { sp = 'Cyan', undercurl = true,             ctermbg = 'Cyan' })
  hi('SpellRare',    { sp = 'Magenta', undercurl = true,          ctermbg = 'Magenta' })
  hi('TabLine',      { bg = 'DarkGrey', underline = true,         ctermfg = 'White', ctermbg = 'DarkGrey', cterm = { underline = true } })
  hi('Title',        { fg = '#48d597',                            ctermfg = 'LightMagenta' })
  hi('Function',     { fg = '#48d597', bold = true,                           ctermfg = 'LightMagenta' })
  hi('Visual',       { fg = 'LightGrey', bg = '#575757',          ctermfg = 'Black', ctermbg = 'Grey' })
  hi('WarningMsg',   { fg = 'Red',                                ctermfg = 'LightRed' })
  hi('Comment',      { fg = '#888896',                            ctermfg = 'Cyan' })
  hi('Constant',     { fg = '#e87e97',                            ctermfg = 'Magenta' })
  hi('String',       { fg = '#48d597',                            ctermfg = 'Magenta' })
  hi('Special',      { fg = '#48d597',                             ctermfg = 'LightRed' })
  hi('Identifier',   { fg = '#a2dfc5',                            ctermfg = 'Cyan', cterm = { bold = true } })
  hi('Statement',    { fg = '#7996dd',                           ctermfg = 'Yellow' })
  hi('PreProc',      { fg = '#f1d78f',                            ctermfg = 'LightBlue' })
  hi('Type',         { fg = '#efef8f',               ctermfg = 'LightGreen' })
  hi('Underlined',   { fg = '#80a0ff', underline = true,          ctermfg = 'LightBlue', cterm = { underline = true } })
  hi('Text',         { fg = '#E7E8E8',               ctermfg = 'LightGreen' })
  hi('Ignore',       {                                            ctermfg = 'Black' })
end
--stylua: ignore end
