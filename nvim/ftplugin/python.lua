-- runs pycodestyle on the active file
--vim.keymap.set('n', '<leader>pc', '<cmd>!pycodestyle %<cr>')
--
local lint = function(file)
	local command = 'pycodestyle ' .. file
	-- runs the command and returns the system output as a list
	local result = vim.fn.systemlist(command)

	-- populates the quickfixlist
	vim.fn.setqflist({}, 'r', { title = file, lines = result })

	-- opens the quickfixlist
	vim.cmd('copen')
end

vim.keymap.set('n', '<leader>pc', function()
	local current_buffer = vim.api.nvim_buf_get_name(0)
	lint(current_buffer)
end)
