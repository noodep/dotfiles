return {
	cmd = { 'deno', 'lsp' },
	filetypes = {
		'javascript',
		'typescript',
	},
	root_markers = {
		'deno.json',
	},
	settings = {
		deno = {
			enable = true,
		},
	},
}
