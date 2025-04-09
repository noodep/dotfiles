-- uses
vim.api.nvim_set_option_value('makeprg', 'deno lint --compact --quiet', { buf = 0 })
vim.api.nvim_set_option_value('errorformat', 'file://%f: line %l\\, col %c - %m', { buf = 0 })

vim.api.nvim_set_var('javaScript_fold', true)
vim.api.nvim_set_option_value('signcolumn', 'yes', { win = 0 })

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


-- lsp setup
-- use checkhealth lsp to display and inspect lsp status

-- enables builtin autocompletion
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
-- start lsp (should be replaced with the builtin config introduced in v0.11
local root = vim.fs.root(0, {'deno.json'})
vim.lsp.start({
	name = 'deno',
	cmd = {'deno', 'lsp'},
	root_dir = root,
})
-- experimental snippets
--
vim.keymap.set('n', '<leader>fori', 'ofor (let idx = 0 ; idx < count ; idx++) {<cr>}<esc>/idx<cr>');
vim.keymap.set('n', '<leader>forw', '"syiwofor (const <esc>"spxa of <esc>"spa) {<cr>};<esc>');
vim.keymap.set('n', '<leader>log', 'i<cr>console.log(@);<cr><esc>/@<cr>');
vim.keymap.set('n', '<leader>lw', 'yiwoconsole.log(<esc>pa);<esc>');
vim.keymap.set('v', '<leader>lv', 'yoconsole.log(<esc>pa);<esc>');
