-- Disables compatibility with vi
vim.opt.compatible = false

-- Sets space as leader key
vim.g.mapleader = ' '

-- Ensures encoding is utf-8
vim.opt.encoding = 'utf-8'

-- Enables syntax highlighting and sets colorscheme
-- in nvim syntax is on by default
vim.cmd('syntax enable')
vim.cmd('colorscheme noodep')

-- Turns on relative line numbers in the gutter
vim.opt.number = true
vim.opt.relativenumber = true

-- Keeps the cursor line 30 lines away from the top and bottom edges
vim.opt.scrolloff = 32
vim.opt.sidescrolloff = 16

-- Sets tab length
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Displays whitespace characters
vim.opt.list = true
vim.opt.listchars = {space = '·', tab = '| ', trail = '-', eol = '¬'}

-- Disables line wrapping
vim.opt.wrap = false

-- Turns on current line highlighting
vim.opt.cursorline = true

-- Turns on border for floating windows
vim.opt.winborder = 'rounded'

-- Customizes completion behavior
-- menuone - Shows the menu even if there is only one item
-- longest - Inserts the longest common denominator
-- preview - Shows additionnal information when available
-- fuzzy   - Enables fuzzy, allowing to type character out of sequence
vim.opt.completeopt = {'menuone', 'noinsert', 'preview', 'fuzzy'}
-- the behavior of 'fuzzy' and 'longest' is not well defined and just deletes the characters the completion is based on
--   if 'edges' and 'addEdges' are candidates, the longest chain is just and empty set which is what gets inserted replacing what was typed so far
-- vim.opt.completeopt = {'menuone', 'longest', 'preview', 'fuzzy'}

-- Remaps insert mode exit to 'TH'
vim.keymap.set('i', 'TH', '<ESC>')

-- Remaps command key to avoid having to use shift
vim.keymap.set('', ';', ':')

-- Rebinds home row for dvorak layout
vim.keymap.set('', 'd', 'h')
vim.keymap.set('', 'h', 'j')
vim.keymap.set('', 't', 'k')
vim.keymap.set('', 'n', 'l')

vim.keymap.set('', 'j', 'd')
vim.keymap.set('', 'k', 't')
vim.keymap.set('', 'l', 'n')
vim.keymap.set('', 'L', 'N')

-- Remaps window navigation to ctrl+{nav-key}
vim.keymap.set('', '<C-d>', '<C-w>h')
vim.keymap.set('', '<C-h>', '<C-w>j')
vim.keymap.set('', '<C-t>', '<C-w>k')
vim.keymap.set('', '<C-n>', '<C-w>l')

-- Remaps tag navigation
-- h follows the tag, t goes back up the stack
vim.keymap.set('', '<leader>h', '<C-]>')
vim.keymap.set('', '<leader>t', '<C-t>')


-- netrw

-- netrw navigation remapping
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function()
		local options = { buffer = true }
		vim.opt_local.bufhidden = 'hide'
		vim.keymap.set('', 'd', 'h', options)
		vim.keymap.set('', 'h', 'j', options)
		vim.keymap.set('', 't', 'k', options)
		vim.keymap.set('', 'n', 'l', options)
	end,
})

-- removes netrw top banner
vim.g.netrw_banner = 0

-- sets list style to a tree
vim.g.netrw_liststyle = 3

-- opens netrw
vim.keymap.set('', '<leader>e', '<cmd>25Lex<cr>')

-- init.lua mappings (c stands for configuration)
vim.keymap.set('', '<leader>cr', '<cmd>source ~/Projects/dotfiles/nvim/init.lua<cr>')
vim.keymap.set('', '<leader>ce', '<cmd>edit ~/Projects/dotfiles/nvim/init.lua<cr>')

-- quickfixlist mappings
vim.keymap.set('n', '[\'', '<cmd>cprev<cr>')
vim.keymap.set('n', ']\'', '<cmd>cnext<cr>')

-- grep mappings (s stands for search)
-- grep program defaults to 'rg --vimgrep -uu' if ripgrep is available; -uu remove smart filtering (.gitignore and hidden .files) which I want
vim.opt.grepprg = 'rg --vimgrep'
vim.keymap.set('n', '<leader>sg', ':copen | :silent :grep')

-- diagnostics
-- enables inline diagnostics for the current line only
vim.diagnostic.config({
	-- shows first diagnostic in line with the diagnostic
	-- virtual_text = { current_line = true },
	-- shows all diagnostics in virtual lines below the diagnostics
	virtual_lines = { current_line = true},
})

-- Enables automatic striping of trailing whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = "*",
	callback = function()
		-- Saves the current cursor position
		local cursor = vim.api.nvim_win_get_cursor(0)

		-- Removes trailing whitespace with a substitute command
		vim.cmd([[%s/\s\+$//e]])

		-- Restores the cursor position
		vim.api.nvim_win_set_cursor(0, cursor)
	end,
})
