if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal matchpairs+=<:>
setlocal commentstring=//\ %s
setlocal comments=b://!,b:///,O://

setlocal include=^\s*use
setlocal includeexpr=v:lua._rust_include_expr()
setlocal isfname=@,48-57,_,:,/
setlocal suffixesadd=.rs

compiler cargo

lua <<EOF
function _rust_include_expr()
    return vim.v.fname:gsub("::", "/")
end
EOF

" lua <<EOF
" function _rust_lsp_format()
"     print("this is a test")
" end
" EOF

function! rust#Format()
    if mode() != 'n'
      return 1
    endif
    lua local s = vim.api.nvim_buf_get_mark(0, "<") ; local e = vim.api.nvim_buf_get_mark(0, ">") ; vim.lsp.buf.format { range={ ["start"]=s, ["end"]=e } }
    return 0
endfunction


setlocal formatexpr=rust#Format()
setlocal textwidth=99
setlocal formatoptions=cqnpljro/
setlocal cpoptions+=J
setlocal joinspaces
setlocal spellcapcheck=[.?!]\ \\{2}
setlocal nowrap

setlocal spell

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=0
setlocal softtabstop=-1

function s:CommentFoldText()
    let l:linecount = v:foldend - v:foldstart + 1
    let l:content = substitute(getline(v:foldstart), '^\(\s*\)//[/!]\s*\(.\{0,60}\).*$', '\1··· \2' ,'')
    return l:content .. ' ··· (' .. l:linecount .. ' lines)'
endfunction

setlocal fillchars=fold:\ 
setlocal foldtext=s:CommentFoldText()
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()

