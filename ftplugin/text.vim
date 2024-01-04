if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1


setlocal textwidth=79
setlocal formatoptions=tcqnp
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


setlocal spell

syntax on
" prevents digits in numbered lists from being marked with cap error
syntax match textDigits /\<[0-9]\+\>/ contains=@NoSpell


if get(g:, "ENABLE_FORMATTED_TEXT", 0)
    setlocal formatoptions+=a

    if winwidth('%') > 90
        let s:totalwidth = (winwidth('%') - &l:textwidth)
        let s:halfwidth = s:totalwidth / 2
        let &l:numberwidth = 20
        if s:halfwidth < 20
            let &l:numberwidth = s:halfwidth
        endif
        let s:columnwidth = s:totalwidth - &l:numberwidth
        let &l:colorcolumn = join(range(&l:textwidth + 2, &l:textwidth + s:columnwidth + 2), ",")
        setlocal number
    else
        setlocal nonumber
        setlocal norelativenumber
    endif

    highlight Normal ctermfg=7 ctermbg=0 guifg=#ffe7d9 guibg=#0e1319
    highlight Visual ctermfg=15 ctermbg=8 guifg=#ffe7d9 guibg=#444444

    highlight ColorColumn      ctermbg=0 guibg=#12171d
    highlight LineNr           ctermfg=0 ctermbg=0 guifg=#12171d guibg=#12171d
    highlight EndOfBuffer      ctermfg=0 ctermbg=0 guifg=#12171d guibg=#12171d
endif

