setlocal tabstop=2
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldlevelstart=99
setlocal foldlevel=99
setlocal foldtext=s:FoldText()
setlocal fillchars=fold:\ 

function s:FoldText()
    let l:content = getline(v:foldstart)
    if l:content =~# '{$'
        return l:content .. ' ··· }'
    elseif l:content =~# '[$'
        return l:content .. ' ··· ]'
    else
        return l:content .. ' ······'
    endif
endfunction
