-- uses
vim.api.nvim_set_option_value('makeprg', 'deno lint --compact --quiet', { buf = 0 })
vim.api.nvim_set_option_value('errorformat', 'file://%f: line %l\\, col %c - %m', { buf = 0 })

vim.api.nvim_set_var('javaScript_fold', true)

-- Enables jsdoc highlighting
-- vim.g.javascript_plugin_jsdoc = 1

-- check quickfix list status and open if not empty
function set_quickfix_visibility()
	local quickfix_list = vim.fn.getqflist()

	if vim.tbl_isempty(quickfix_list) then
		vim.cmd('cclose')
	else
		vim.cmd('copen')
	end
end

vim.keymap.set('n', '<leader>lf', function()
	local current_buffer = vim.api.nvim_buf_get_name(0)
	vim.cmd('make ' .. current_buffer)
	set_quickfix_visibility()
end)

vim.keymap.set('n', '<leader>ld', function()
	vim.cmd('make')
	set_quickfix_visibility()
end)
