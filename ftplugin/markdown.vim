if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal wrap
setlocal linebreak
setlocal breakindent
setlocal breakindentopt=list:-1
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:\\&^.\\{4\\}
setlocal formatoptions=
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal spell

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> ^ g^
noremap  <buffer> <silent> $ g$
noremap  <buffer> <silent> I g^i
noremap  <buffer> <silent> A g$ha
