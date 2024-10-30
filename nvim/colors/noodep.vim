set background=dark
hi clear

let g:color_name = "noodep"

hi Normal ctermfg=7
hi Visual ctermfg=6 ctermbg=8
hi Comment cterm=italic ctermfg=9
hi String ctermfg=2
hi Function ctermfg=4
hi Keyword ctermfg=5
hi CursorLine ctermbg=8

" Displays listchars characters
hi SpecialKey ctermfg=8

" Displays listchars whitespace characters as other listchars
hi! link Whitespace SpecialKey
hi! link NonText SpecialKey

" Foreground = #EEFFFF
" Background = #263238
" Selection  = #565A6D
" Comments   = #546E7A
