vim.cmd('hi clear')
if vim.g.syntax_on ~= nil then
	vim.cmd('syntax reset')
end

vim.g.colors_name = 'newdep'

-- palette
local mocha = {
	bg        = '#1e1e2e',
	fg        = '#cdd6f4',

	cursor    = '#f5e0dc',
	selection = '#585b70',

	black     = '#45475a',
	br_black  = '#585b70',

	red       = '#f38ba8',
	br_red    = '#f37779',

	green     = '#a6e3a1',
	br_green  = '#89d88b',

	yellow    = '#f9e2af',
	br_yellow = '#ebd391',

	blue      = '#89b4fa',
	br_blue   = '#74a8fc',

	magenta   = '#f5c2e7',
	br_magenta = '#f2aede',

	cyan      = '#94e2d5',
	br_cyan   = '#6bd7ca',

	white     = '#a6adc8',
	br_white  = '#bac2de',
}

local colors = mocha

local hls = {
	-- base UI
	Normal       = { fg = colors.fg, bg = 'none' },
	Visual       = { bg = colors.selection },
	CursorLine   = { bg = colors.br_black },
	LineNr       = { fg = colors.blue },
	CursorLineNr = { fg = colors.br_yellow, bold = true },
	Search       = { fg = colors.bg, bg = colors.br_cyan },
	IncSearch    = { fg = colors.bg, bg = colors.br_yellow },
	ColorColumn  = { bg = colors.br_black },
	Question     = { fg = colors.br_green },

	-- Syntax
	Comment      = { fg = colors.red, italic = true },
	Constant     = { fg = colors.br_red },
	String       = { fg = colors.br_green },
	Number       = { fg = colors.br_red },
	Boolean      = { link = Number },
	Float        = { link = Number },

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

	-- Completion Menu (Pmenu)
	Pmenu        = { fg = colors.fg, bg = 'none' },
	PmenuSel     = { fg = colors.br_white, bg = colors.selection, bold = true },
	PmenuSbar    = { bg = colors.black },
	PmenuThumb   = { bg = colors.cursor },
	PmenuBorder  = { fg = colors.selection, bg = 'none' },
	PmenuMatch    = { fg = colors.br_blue, bold = true },
	PmenuMatchSel = { fg = colors.br_cyan, bold = true },
	PmenuKind     = { fg = colors.cyan },
	PmenuExtra    = { fg = colors.br_red, italic = true },

	-- UI Elements
	SpecialKey   = { fg = colors.br_black },
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
	SignColumn   = { bg = 'none' },
	FoldColumn   = { bg = 'none', fg = colors.br_red },
}

for group, hl in pairs(hls) do
	vim.api.nvim_set_hl(0, group, hl)
end
