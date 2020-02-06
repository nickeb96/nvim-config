
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


hi Normal ctermfg=White ctermbg=Black guifg=White guibg=Black
hi LineNr ctermfg=Grey guifg=Grey
hi Visual ctermbg=Grey guibg=Grey

hi SpellBad ctermfg=Red guifg=Red
hi SpellCap ctermfg=Yellow guifg=Yellow

hi EndOfBuffer ctermfg=Grey guifg=Grey

