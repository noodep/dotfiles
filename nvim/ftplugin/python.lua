-- runs pycodestyle on the active file
--vim.keymap.set('n', '<leader>pc', '<cmd>!pycodestyle %<cr>')

-- permanentely displays the gutter
vim.api.nvim_set_option_value('signcolumn', 'yes', { win = 0 })

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

-- lsp setup
-- use checkhealth lsp to display and inspect lsp status
vim.lsp.config('ruff', {
	cmd = { 'ruff', 'server'},
	filetypes = { 'python' },
	root_markers = { 'pyproject.toml' },
	settings = {
	},
})

vim.lsp.config('basedpyright', {
	cmd = { 'basedpyright-langserver', '--stdio'},
	filetypes = { 'python' },
	root_markers = { 'pyproject.toml' },
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = 'strict',
				diagnosticMode = 'workspace',
			},
		},
	},
})

vim.lsp.enable('ruff')
vim.lsp.enable('basedpyright')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
