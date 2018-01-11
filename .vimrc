set nocompatible
syntax enable
filetype plugin indent on
set hidden
set tabstop=2
set shiftwidth=2
set encoding=utf-8

inoremap TH <ESC>
noremap d h
noremap h j
noremap t k
noremap n l

noremap j d
noremap k t
noremap l n
noremap L N

noremap ; :
noremap : ;

" Remap netrw for dvorak
augroup netrw
	autocmd!
	autocmd filetype netrw call Netrw_remap()
augroup END

function! Netrw_remap()
	noremap <buffer> d h
	noremap <buffer> h j
	noremap <buffer> t k
	noremap <buffer> n l
endfunction
