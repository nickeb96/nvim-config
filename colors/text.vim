
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

hi Normal ctermfg=White ctermbg=Black guifg=#f0f0f0 guibg=#181818
hi Visual ctermfg=White ctermbg=DarkGrey guifg=#ffffff guibg=#606060

hi SpellBad ctermfg=Red guifg=#f08080
hi SpellCap ctermfg=Yellow guifg=#e0e070

hi ColorColumn ctermbg=Black guibg=#1d1f21
"hi LineNr ctermfg=Grey ctermbg=Black guifg=#c5c8c6 guibg=#1d1f21
hi LineNr ctermfg=Black ctermbg=Black guifg=#1d1f21 guibg=#1d1f21

hi EndOfBuffer ctermfg=Grey ctermbg=Black guifg=#1d1f21 guibg=#1d1f21

