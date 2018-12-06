" Enable folding based on curly braces
set foldmethod=marker
set foldmarker={,}
set nofoldenable

augroup noodepjs
	autocmd!
	autocmd BufWritePre *.js call RestoreView('IncVersionNumber')
	autocmd BufWritePre *.js call RestoreView('StripTrailingWhitespace')
augroup END

