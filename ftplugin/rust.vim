if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal matchpairs+=<:>
setlocal commentstring=//\ %s
setlocal comments=b://!,b:///,O://

setlocal textwidth=99
setlocal formatoptions=cnpljqro
setlocal cpoptions+=J
setlocal joinspaces
setlocal spellcapcheck=[.?!]\ \\{2}
setlocal nowrap

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function rust#CommentFoldText()
    let l:linecount = v:foldend - v:foldstart + 1
    let l:content = substitute(getline(v:foldstart), '^\(\s*\)//[/!]\s*\(.\{0,60}\).*$', '\1··· \2' ,'')
    return l:content .. ' ··· (' .. l:linecount .. ' lines)'
endfunction

setlocal fillchars=fold:\ 
setlocal foldtext=rust#CommentFoldText()
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()

setlocal spell
