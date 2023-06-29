if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1


setlocal wrap
setlocal linebreak
setlocal breakindent
setlocal breakindentopt=list:-1
" setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+>]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:\\&^.\\{4\\}
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\(\\s*[-*+>]\\s\\+\\)\\+
setlocal formatoptions=
setlocal tabstop=4
setlocal shiftwidth=0
setlocal softtabstop=-1

setlocal concealcursor=n
setlocal conceallevel=2

setlocal spell

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> ^ g^
noremap <buffer> <silent> $ g$
noremap <buffer> <silent> I g^i
nnoremap <buffer> <silent> A :call MarkdownCapitalA()<Escape>a

function MarkdownCapitalA()
    normal g$
    let l:colnum = virtcol('.')
    let l:linelength = strwidth(getline('.'))
    if l:colnum < l:linelength
        normal h
    endif
endfunction

function s:IsFirstDisplayColumn()
    if &number || &relativenumber
        let l:numcoloff = &numberwidth
    else
        let l:numcoloff = 0
    endif
    let l:displaycol = screencol() - l:numcoloff
    return l:displaycol == 1 && col('.') > 1
endfunction

function s:MoveCursorRight()
    let l:cursorpos = getpos('.')
    let l:cursorpos[2] = l:cursorpos[2] + 1
    call setpos('.', l:cursorpos)
endfunction

function s:MakeRightGutter()
    if winnr('$') == 1 && len(getbufinfo({'buflisted': 1})) == 1
        let l:winwidth = winwidth('%')
        let l:needed = &numberwidth + 80 + 1
        if l:needed < l:winwidth
            let l:mainwinid = winnr()
            let l:remaining = l:winwidth - l:needed
            setlocal splitright
            exec l:remaining .. 'vnew'
            setlocal nonumber norelativenumber
            setlocal fillchars=eob:\ 
            let l:gutterwinid = winnr()
            wincmd p
            exec 'au QuitPre <buffer> ' .. l:gutterwinid .. "wincmd c"
        endif
        hi WinSeparator guifg=#1d1f21 guibg=#1d1f21
    endif
endfunction

augroup markdown
    autocmd!
    au InsertLeave *.md     if s:IsFirstDisplayColumn()
                        \ |     call s:MoveCursorRight()
                        \ | endif
    au VimEnter *.md        call s:MakeRightGutter()
augroup END


