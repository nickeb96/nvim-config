
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "markdown"


hi Normal                       cterm=none ctermfg=white ctermbg=black gui=none guifg=white guibg=black
hi LineNr                       cterm=bold ctermfg=lightgrey gui=bold guifg=lightgrey
hi Visual                       cterm=none ctermbg=darkgrey gui=none guibg=grey
hi Error                        cterm=none ctermbg=none ctermfg=none

hi Statement                    cterm=bold ctermfg=9
hi Constant                     cterm=bold ctermfg=13
hi Comment                      cterm=italic ctermfg=8
hi String                       ctermfg=10
hi Identifier                   ctermfg=6
hi Type                         ctermfg=12


hi markdownRule                 cterm=bold

hi markdownHeadingRule          cterm=bold ctermfg=15
hi markdownH1                   cterm=bold ctermfg=15
hi markdownH1Delimiter          cterm=bold ctermfg=15
hi markdownH2                   cterm=bold ctermfg=15
hi markdownH2Delimiter          cterm=bold ctermfg=15
hi markdownH3                   cterm=bold ctermfg=15
hi markdownH3Delimiter          cterm=bold ctermfg=15
hi markdownH4                   cterm=bold ctermfg=15
hi markdownH4Delimiter          cterm=bold ctermfg=15
hi markdownH5                   cterm=bold ctermfg=15
hi markdownH5Delimiter          cterm=bold ctermfg=15
hi markdownH6                   cterm=bold ctermfg=15
hi markdownH6Delimiter          cterm=bold ctermfg=15

hi markdownLinkText             cterm=underline ctermfg=4
hi markdownUrl                  ctermfg=12
hi markdownAutomaticLink        cterm=underline ctermfg=4

hi markdownListMarker           cterm=bold ctermfg=15
hi markdownOrderedListMarker    cterm=bold ctermfg=15

hi markdownCode                 cterm=none ctermfg=3
hi markdownCodeDelimiter        cterm=none ctermfg=3

hi markdownMath                 cterm=none ctermfg=14
hi markdownMathDelimiter        cterm=none ctermfg=8

hi markdownItalic               cterm=italic ctermfg=none
hi markdownItalicDelimiter      cterm=none ctermfg=none
hi markdownBold                 cterm=bold ctermfg=none
hi markdownBoldDelimiter        cterm=none ctermfg=none
hi markdownBoldItalic           cterm=bold,italic ctermfg=none
hi markdownBoldItalicDelimiter  cterm=none ctermfg=none
hi markdownStrike               cterm=none ctermfg=8
hi markdownStrikeDelimiter      cterm=none ctermfg=none
hi markdownInsert               cterm=underline ctermfg=none
hi markdownInsertDelimiter      cterm=none ctermfg=none
hi markdownMark                 cterm=bold ctermfg=0 ctermbg=11
hi markdownMarkDelimiter        cterm=none ctermfg=none


hi clear SpellBad
hi SpellBad ctermfg=1
hi clear SpellCap
hi SpellCap ctermfg=3
hi clear SpellRare
"hi SpellRare ctermfg=15
hi clear SpellLocal
"hi SpellLocal ctermfg=15

