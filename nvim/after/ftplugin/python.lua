-- creates the `python_indent` dictionary first
-- the dictionary does not exists yet as it gets initialized for the first time when indentation is performed (through nvim autoloading)
-- trying to set values here without creating it first would result in trying to index a nil value
-- see nvim/runtime/autoload/python.vim

vim.g.python_indent = {
	-- indent closing paren/bracket with the first character of the ligne that started the multiline construct
	closed_paren_align_last_line = false,
	-- indent only one 'step' after an open paren/bracket
	open_paren = 'shiftwidth()',
}
