-- uses
vim.api.nvim_set_option_value('makeprg', 'deno lint --compact --quiet', { buf = 0 })
vim.api.nvim_set_option_value('errorformat', 'file://%f: line %l\\, col %c - %m', { buf = 0 })

vim.api.nvim_set_var('javaScript_fold', true)
vim.api.nvim_set_option_value('signcolumn', 'yes', { win = 0 })

-- Enables jsdoc highlighting
-- vim.g.javascript_plugin_jsdoc = 1

-- check quickfix list status and open if not empty
local function set_quickfix_visibility()
	if vim.fn.getqflist({ size = 0 }).size == 0 then
		vim.cmd('cclose')
	else
		vim.cmd('copen')
	end
end

vim.keymap.set('n', '<leader>lf', function()
	local current_buffer = vim.api.nvim_buf_get_name(0)
	vim.cmd('make ' .. vim.fn.fnameescape(current_buffer))
	set_quickfix_visibility()
end, { buf = 0, silent = true, desc = 'Lint current file' })

vim.keymap.set('n', '<leader>ld', function()
	vim.cmd('make')
	set_quickfix_visibility()
end, { buf = 0, silent = true, desc = 'Lint project' })

-- experimental snippets
--
vim.keymap.set('n', '<leader>fori', 'ofor (let idx = 0 ; idx < count ; idx++) {<cr>}<esc>/idx<cr>', { buf = 0, silent = true, desc = 'Insert for index loop' })
vim.keymap.set('n', '<leader>forw', '"syiwofor (const <esc>"spxa of <esc>"spa) {<cr>};<esc>', { buf = 0, silent = true, desc = 'Wrap word in for-of' })
-- replace with vim.snippet.expand
vim.keymap.set('n', '<leader>log', 'i<cr>console.log(@);<cr><esc>/@<cr>', { buf = 0, silent = true, desc = 'Insert console.log snippet' })
vim.keymap.set('n', '<leader>lw', 'yiwoconsole.log("<esc>pa :", <esc>pa);<esc>', { buf = 0, silent = true, desc = 'Log current word' })
vim.keymap.set('v', '<leader>lv', 'yoconsole.log(<esc>pa);<esc>', { buf = 0, silent = true, desc = 'Log visual selection' })
