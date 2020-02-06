set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "fish"


hi Normal                       guifg=#00afff guibg=#111111
hi LineNr                       cterm=bold ctermfg=lightgrey
hi Visual                       cterm=none ctermbg=darkgrey
hi Error                        guifg=red
hi EndOfBuffer                  guifg=#005777

hi fishKeyword                  guifg=#6159de
hi fishStatement                guifg=#6159de
hi fishConditional              guifg=#6159de
hi fishRepeat                   guifg=#6159de
hi fishLabel                    guifg=#6159de
hi fishIdentifier               guifg=#22ffff
hi fishString                   guifg=#b3b206
hi fishComment                  guifg=#cc3333


