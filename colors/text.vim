
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "text"


hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal

" alacritty background: '#1d1f21'
" alacritty foreground: '#c5c8c6'
"
" normal:
"    black:   '#1d1f21'
"    red:     '#cc6666'
"    green:   '#b5bd68'
"    yellow:  '#f0c674'
"    blue:    '#81a2be'
"    magenta: '#b294bb'
"    cyan:    '#8abeb7'
"    white:   '#c5c8c6'
"
" bright:
"    black:   '#666666'
"    red:     '#d54e53'
"    green:   '#b9ca4a'
"    yellow:  '#e7c547'
"    blue:    '#7aa6da'
"    magenta: '#c397d8'
"    cyan:    '#70c0b1'
"    white:   '#eaeaea'


hi Normal ctermfg=7 ctermbg=0 guifg=#c5c8c6 guibg=#181a1c
hi Visual ctermfg=15 ctermbg=8 guifg=#c5c8c6 guibg=#444444

hi SpellBad guisp=#cc6666 cterm=undercurl gui=undercurl
hi SpellCap guisp=#f0c674 cterm=undercurl gui=undercurl

hi ColorColumn      ctermbg=0 guibg=#1d1f21
hi LineNr           ctermfg=0 ctermbg=0 guifg=#1d1f21 guibg=#1d1f21
hi EndOfBuffer      ctermfg=0 ctermbg=0 guifg=#1d1f21 guibg=#1d1f21

