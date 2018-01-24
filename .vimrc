" Disables compatibility with vi
set nocompatible

" Enables syntax highlighting
syntax enable

colorscheme noodep

" Enables loading plugin and indent file based on the filetype 
filetype plugin indent on

" Allows new files openning when the current buffer has unsaved changes
set hidden

" Sets tab length
set tabstop=2
set shiftwidth=2

" Sets encoding
set encoding=utf-8

" Remaps insert mode exit to TH
inoremap TH <ESC>

" Remaps movement keys to dvorak layout
noremap d h
noremap h j
noremap t k
noremap n l

noremap j d
noremap k t
noremap l n
noremap L N

noremap <C-w>d <C-w>h
noremap <C-w>h <C-w>j
noremap <C-w>t <C-w>k
noremap <C-w>n <C-w>l

" Remaps command key to avoid using shift
noremap ; :
noremap : ;

" Remaps netrw for dvorak
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
