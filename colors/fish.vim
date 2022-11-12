set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "fish"

hi LineNr           guifg=#465457 guibg=#212223
hi NonText          guifg=#465457
hi Visual                         guibg=#444444 gui=bold
hi Pmenu            guifg=#c8c8c8 guibg=NONE
hi PmenuSel         guifg=#c8c8c8 guibg=#444444 gui=bold
hi Search           guifg=#232526 guibg=#ead670 gui=bold
hi IncSearch        guifg=#232526 guibg=#f6a57d gui=bold
hi Todo             guifg=#b5a557 guibg=NONE


hi fish_color_command           guifg=#c6d57e
hi fish_color_comment           guifg=#888888 gui=italic
hi fish_color_end               guifg=#87a7b3
hi fish_color_escape            guifg=#b5d0b3 gui=bold
hi fish_color_keyword           guifg=#c6d57e
hi fish_color_normal            guifg=#c8c8c8
hi fish_color_operator          guifg=#a5d3c5
hi fish_color_option            guifg=#ffe1af
hi fish_color_param             guifg=#c8c8c8
hi fish_color_quote             guifg=#acc6aa
hi fish_color_redirection       guifg=#87a7b3

