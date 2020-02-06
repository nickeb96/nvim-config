
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "python"


highlight pythonComment ctermfg=241 guifg=#626262
highlight pythonRun ctermfg=246 guifg=#949494
highlight pythonCoding ctermfg=246 guifg=#949494

"original
"primaryblue=38
"primaryyellow=227
"secondaryblue=81
"purple=135

"idk what this is
"yellow=226
"blue=25
"orange=214
"grey=152
"blue2=61
"redish=132

"stuff from color palate using sRGB
"orange=173
"yellow=185
"blue=67
"red=168
"purple=139
"green=149,150
"stringgreen=107
"lightblue=117
"neutral=144,180

highlight IndentLine ctermfg=173 ctermbg=233 guifg=#d7875f guibg=#121212
highlight indentLine ctermfg=173 ctermbg=233 guifg=#d7875f guibg=#121212

highlight Normal ctermfg=252 ctermbg=233 guifg=#d0d0d0 guibg=#121212
highlight LineNr ctermfg=236 guifg=#303030
"highlight CursorLineNr ctermfg=139
"highlight Visual ctermfg=238 ctermbg=255
highlight Visual ctermbg=239 guibg=#4e4e4e
highlight MatchParen ctermfg=168 ctermbg=233 guifg=#d75f87 guibg=#121212
highlight EndOfBuffer ctermfg=236 guifg=#303030

highlight pythonStatement ctermfg=67 guifg=#5f87af
highlight pythonOperator ctermfg=67 guifg=#5f87af

highlight pythonRepeat ctermfg=67 guifg=#5f87af
highlight pythonConditional ctermfg=67 guifg=#5f87af
highlight pythonException ctermfg=67 guifg=#5f87af
highlight pythonImport ctermfg=173 guifg=#d7875f

highlight pythonBuiltinFunc ctermfg=185 guifg=#d7d75f
highlight pythonFunction ctermfg=185 guifg=#d7d75f
highlight pythonClass ctermfg=185 guifg=#d7d75f
highlight pythonDottedName ctermfg=185 guifg=#d7d75f
highlight pythonDecorator ctermfg=117 guifg=#87d7ff

highlight pythonConstant ctermfg=180 guifg=#d7af87

highlight pythonBuiltinObj ctermfg=140 guifg=#af87d7
highlight Constant ctermfg=140 guifg=#af87d7
highlight String ctermfg=107 guifg=#87af5f
highlight Special ctermfg=154 guifg=#afff00


highlight pythonExClass ctermfg=168 guifg=#d75f87
highlight pythonWarnClass ctermfg=173 guifg=#d7875f


"highlight Type ctermfg=None

" comment

