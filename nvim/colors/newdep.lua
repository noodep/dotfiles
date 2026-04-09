vim.cmd('hi clear')
if vim.g.syntax_on ~= nil then
	vim.cmd('syntax reset')
end
vim.g.colors_name = 'newdep'

-- palette
local colors = {
	bg        = '#191c27',
	fg        = '#aea47a',
	cursor    = '#92805b',
	selection = '#172539',

	black     = '#181818',
	br_black  = '#343a53',

	red       = '#810009',
	br_red    = '#ac3835',

	green     = '#5a844a',
	br_green  = '#62ac51',

	yellow    = '#cc8b3f',
	br_yellow = '#dcdf7c',

	blue      = '#576d8c',
	br_blue   = '#3097c6',

	magenta   = '#724d7c',
	br_magent = '#d33061',

	cyan      = '#5c4f4b',
	br_cyan   = '#f3dbb2',

	white     = '#aea47f',
	br_white  = '#f4f4f4',
}

local hls = {
	-- base UI
	Normal       = { fg = colors.fg, bg = 'NONE' },
	Visual       = { bg = colors.selection },
	CursorLine   = { bg = colors.br_black },
	LineNr       = { fg = colors.blue },
	CursorLineNr = { fg = colors.br_yellow, bold = true },
	Search       = { fg = colors.bg, bg = colors.br_cyan },
	IncSearch    = { fg = colors.bg, bg = colors.br_yellow },
	ColorColumn  = { bg = colors.br_black },
	Question     = { fg = colors.br_green },

	-- Syntax
	Comment      = { fg = colors.br_red, italic = true }, -- Steel blue comments look great on this bg
	Constant     = { fg = colors.red },
	String       = { fg = colors.br_green },
	Number       = { fg = colors.br_red },
	Boolean      = { fg = colors.br_red },
	Float        = { fg = colors.br_red },

	Function     = { fg = colors.br_blue },
	Keyword      = { fg = colors.br_yellow },
	Statement    = { fg = colors.br_yellow },
	Conditional  = { fg = colors.br_yellow },
	Repeat       = { fg = colors.br_yellow },

	Type         = { fg = colors.br_cyan },
	Structure    = { fg = colors.br_cyan },
	Identifier   = { fg = colors.br_white },
	Operator     = { fg = colors.fg },
	PreProc      = { fg = colors.magenta },
	Special      = { fg = colors.br_magenta },
	Todo         = { fg = colors.br_red, bold = true },

	-- Completion Menu (Pmenu) - Using your deep selection blue
	Pmenu        = { fg = colors.fg, bg = 'none' },
	PmenuSel     = { fg = colors.br_white, bg = colors.selection, bold = true },
	PmenuSbar    = { bg = colors.black },
	PmenuThumb   = { bg = colors.cursor },
	PmenuBorder  = { fg = colors.selection, bg = 'none' },
	PmenuMatch    = { fg = colors.br_blue, bold = true },
	PmenuMatchSel = { fg = colors.br_cyan, bold = true },
	PmenuKind     = { fg = colors.cyan },
	PmenuExtra    = { fg = colors.comment, italic = true },

	-- UI Elements
	SpecialKey   = { fg = colors.cyan },
	NonText      = { link = 'SpecialKey' },
	Whitespace   = { link = 'SpecialKey' },
	WinSeparator = { fg = colors.br_black, bg = 'none' },

	-- Floating Windows
	NormalFloat  = { fg = colors.br_white, bg = 'none' },
	FloatBorder  = { fg = colors.fg, bg = 'none' },
	FloatTitle   = { fg = colors.br_blue, bold = true },

	-- Diagnostics
	DiagnosticError = { fg = colors.br_red },
	DiagnosticWarn  = { fg = colors.yellow },
	DiagnosticInfo  = { fg = colors.blue },
	DiagnosticHint  = { fg = colors.br_green },

	-- Gutter/Signs
	SignColumn   = { bg = 'NONE' },
	FoldColumn   = { bg = 'NONE', fg = colors.comment },
}

for group, hl in pairs(hls) do
	vim.api.nvim_set_hl(0, group, hl)
end

local modern_hls = {
	-- Treesitter tokens
	['@variable']            = { fg = colors.br_white },
	['@variable.builtin']    = { fg = colors.br_cyan, italic = true },
	['@constant.builtin']    = { fg = colors.br_red, bold = true },
	['@function.builtin']    = { fg = colors.br_red, bold = true },
	['@keyword.import']      = { fg = colors.magenta, italic = true },
	['@keyword.operator']    = { fg = colors.blue },
	['@keyword.return']      = { fg = colors.purple, italic = true },
	['@property']            = { fg = colors.white },
	['@markup.heading']      = { fg = colors.br_yellow, bold = true },
	['@markup.link']         = { fg = colors.br_blue },
	['@punctuation.bracket'] = { fg = colors.fg },
	['@constructor']         = { fg = colors.green },
	['@tag']                 = { fg = colors.blue },
	['@tag.attribute']       = { fg = colors.cyan },
	['@module']              = { fg = colors.cyan },

	-- LSP Semantic Tokens
	['@lsp.type.class']         = { link = 'Type' },
	['@lsp.type.decorator']     = { fg = colors.green },
	['@lsp.type.constructor']     = { fg = colors.green },
	['@lsp.type.parameter']     = { fg = colors.fg, italic = true },
	['@lsp.type.property']      = { fg = colors.br_cyan },
	['@lsp.type.variable']      = { fg = colors.br_cyan },
	['@lsp.type.function']      = { fg = colors.br_red, bold = true },
}

for group, hl in pairs(modern_hls) do
	vim.api.nvim_set_hl(0, group, hl)
end
