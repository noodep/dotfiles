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
set tabstop=4
set shiftwidth=4

" Disables wrapping
set nowrap

" Turns on current line highlighting
set cursorline

" Turns on search highlighting
set hlsearch

" Turns on relative numbers on the gutter
set relativenumber

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

" Remaps window navigation to shift+{nav-key}
noremap D <C-w>h
noremap H <C-w>j
noremap T <C-w>k
noremap N <C-w>l

" Remaps command key to avoid using shift
noremap ; :
noremap : ;

" Utility function to restore the view to its previous state
" Can be used to go back to the original cursor location when modifying the file on save
function! RestoreView(arg)
  let l:view = winsaveview()
  execute a:arg
  call winrestview(l:view)
endfunction

" Remaps netrw for dvorak
augroup netrw
	autocmd!
	autocmd filetype netrw call NetrwRemap()
augroup END

function! NetrwRemap()
	noremap <buffer> d h
	noremap <buffer> h j
	noremap <buffer> t k
	noremap <buffer> n l
endfunction

" Adds version incrementer function
" \zs sets start of match so we only have to replace the actual number
command! IncVersionNumber if &modified | %s/@version\s\zs\(\d\+\.\d\+\)/\=str2float(submatch(1))+0.01/g | endif

" Strips trailing whitespace
command! StripTrailingWhitespace %s/\s\+$//e

augroup noodepjs
	autocmd!
	autocmd BufWritePre *.js call RestoreView('IncVersionNumber')
	autocmd BufWritePre *.js call RestoreView('StripTrailingWhitespace')
augroup END

