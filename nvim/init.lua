-- Sets space as leader key
vim.g.mapleader = ' '

-- Enables syntax highlighting and sets colorscheme
vim.cmd([[colorscheme newdep]])

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

vim.opt.pumborder = 'rounded'


-- Customizes completion behavior
-- enables autocomplete
vim.opt.autocomplete = true

-- adds omnifunction to completion sources
vim.opt.complete:append("o")

-- menuone - Shows the menu even if there is only one item
-- longest - Inserts the longest common denominator
-- preview - Shows additionnal information when available
-- popup   - Shows additionnal information in a popup menu, overrides 'preview'
-- fuzzy   - Enables fuzzy, allowing to type character out of sequence
vim.opt.completeopt = {'menuone', 'noselect', 'popup', 'fuzzy'}
-- the behavior of 'fuzzy' and 'longest' is not well defined and just deletes the characters the completion is based on
--   if 'edges' and 'addEdges' are candidates, the longest chain is just and empty set which is what gets inserted replacing what was typed so far

-- Adds fzf pluging
vim.opt.runtimepath:append('/opt/homebrew/opt/fzf')
-- opens fzf - uses ff instead of a single f to avoid the lag induced by vim waiting for another potential character
vim.keymap.set('n', '<leader>ff', '<cmd>:FZF<cr>')

-- Remaps insert mode exit to 'TH'
vim.keymap.set('i', 'TH', '<ESC>')

-- Remaps command key to avoid having to use shift
vim.keymap.set({ 'n', 'x' }, ';', ':')

-- Rebinds home row for dvorak layout
vim.keymap.set({ 'n', 'x', 'o' }, 'd', 'h')
vim.keymap.set({ 'n', 'x', 'o' }, 'h', 'j')
vim.keymap.set({ 'n', 'x', 'o' }, 't', 'k')
vim.keymap.set({ 'n', 'x', 'o' }, 'n', 'l')

vim.keymap.set({ 'n', 'x', 'o' }, 'j', 'd')
vim.keymap.set({ 'n', 'x', 'o' }, 'k', 't')
vim.keymap.set({ 'n', 'x', 'o' }, 'l', 'n')
vim.keymap.set('n', 'L', 'N')

-- Remaps window navigation to ctrl+{nav-key}
vim.keymap.set('n', '<C-d>', '<C-w>h')
vim.keymap.set('n', '<C-h>', '<C-w>j')
vim.keymap.set('n', '<C-t>', '<C-w>k')
vim.keymap.set('n', '<C-n>', '<C-w>l')

-- Remaps tag navigation
-- h follows the tag, t goes back up the stack
vim.keymap.set('n', '<leader>h', '<C-]>')
vim.keymap.set('n', '<leader>t', '<C-t>')


-- netrw

-- netrw navigation remapping
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function()
		local options = { buffer = true }
		vim.opt_local.bufhidden = 'hide'
		vim.keymap.set('n', 'd', 'h', options)
		vim.keymap.set('n', 'h', 'j', options)
		vim.keymap.set('n', 't', 'k', options)
		vim.keymap.set('n', 'n', 'l', options)
	end,
})

-- removes netrw top banner
vim.g.netrw_banner = 0

-- sets list style to a tree
vim.g.netrw_liststyle = 3

-- opens netrw
vim.keymap.set('n', '<leader>e', '<cmd>25Lex<cr>')

-- init.lua mappings (c stands for configuration)
vim.keymap.set('n', '<leader>cr', '<cmd>source ~/Projects/dotfiles/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>ce', '<cmd>edit ~/Projects/dotfiles/nvim/init.lua<cr>')

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
		-- Saves the current window view
		local view = vim.fn.winsaveview()

		-- Removes trailing whitespace with a substitute command
		vim.cmd([[%s/\s\+$//e]])

		-- Restores the previous window view
		vim.fn.winrestview(view)
	end,
})

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.enable('denols')
