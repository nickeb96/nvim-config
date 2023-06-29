if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1


setlocal textwidth=79
setlocal formatoptions=atcqnp
setlocal formatlistpat=^\\s*[0-9]\\+[.)]\\s
setlocal comments=fb:-
setlocal commentstring=
setlocal cpoptions+=J
setlocal joinspaces
setlocal spellcapcheck=[.?!]\ \\{2}
setlocal nowrap
setlocal sidescroll=8

setlocal tabstop=8
setlocal shiftwidth=0
setlocal softtabstop=-1
setlocal noexpandtab


syntax on
" prevents digits in numbered lists from being marked with cap error
syntax match textDigits /\<[0-9]\+\>/ contains=@NoSpell

hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal

setlocal spell


function Min(first, second)
    if a:first < a:second
        return a:first
    else
        return a:second
    endif
endfunction

if winwidth('%') > 80
    let s:totalwidth = (winwidth('%') - &l:textwidth)
    let s:halfwidth = s:totalwidth / 2
    let &l:numberwidth = Min(s:halfwidth, 20)
    let s:columnwidth = s:totalwidth - &l:numberwidth
    let &l:colorcolumn = join(range(&l:textwidth + 2, &l:textwidth + s:columnwidth + 2), ",")
    setlocal number
else
    setlocal nonumber
    setlocal norelativenumber
endif

highlight Normal ctermfg=7 ctermbg=0 guifg=#c5c8c6 guibg=#191b1d
highlight Visual ctermfg=15 ctermbg=8 guifg=#c5c8c6 guibg=#444444

highlight SpellBad guisp=#cc6666 cterm=undercurl gui=undercurl
highlight SpellCap guisp=#f0c674 cterm=undercurl gui=undercurl

highlight ColorColumn      ctermbg=0 guibg=#1d1f21
highlight LineNr           ctermfg=0 ctermbg=0 guifg=#1d1f21 guibg=#1d1f21
highlight EndOfBuffer      ctermfg=0 ctermbg=0 guifg=#1d1f21 guibg=#1d1f21

