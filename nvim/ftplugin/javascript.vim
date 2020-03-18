" Starts without folds
set nofoldenable

" Enables header version incrementing and white space trailing on .js files
augroup noodepjs
	autocmd!
	autocmd BufWritePre *.js call RestoreView('IncVersionNumber')
	autocmd BufWritePre *.js call RestoreView('StripTrailingWhitespace')
augroup END

