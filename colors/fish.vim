set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "fish"


hi Normal                       guifg=#c8c8c8
hi LineNr                       cterm=bold ctermfg=lightgrey
hi Visual                       cterm=none ctermbg=darkgrey
hi Error                        guifg=#e78293
hi EndOfBuffer                  guifg=#888888 gui=italic

hi fishKeyword                  guifg=#c6d57e
hi fishStatement                guifg=#c6d57e
hi fishConditional              guifg=#c6d57e
hi fishOption                   guifg=#ffe1af
hi fishRedirection              guifg=#87a7b3
hi fishCharacter                guifg=#b5d0b3 gui=bold
hi fishSpecial                  guifg=#c8c8c8
hi fishRepeat                   guifg=#c6d57e
hi fishLabel                    guifg=#c6d57e
hi fishIdentifier               guifg=#a5d3c5
hi fishString                   guifg=#acc6aa
hi fishComment                  guifg=#888888 gui=italic

