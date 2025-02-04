if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1


setlocal wrap
setlocal linebreak
setlocal breakindent
setlocal breakindentopt=list:-1
setlocal breakat=\ 
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\(\\s*[-*+>]\\s\\+\\)\\+
setlocal formatoptions=
setlocal tabstop=2
setlocal shiftwidth=0
setlocal softtabstop=-1

setlocal concealcursor=n
setlocal conceallevel=0

setlocal spell
setlocal spellcapcheck=

" scrolloff doesn't work with gj/gk smoothscroll trick below
setlocal scrolloff=0

lua <<EOF
-- using lua's keymapping bc vim's breaks Visual mode
vim.keymap.set("n", "k", function()
    vim.fn.MoveCursorUp()
end)
vim.keymap.set("n", "j", function()
    vim.fn.MoveCursorDown()
end)
EOF

"noremap <buffer> <silent> k :call MoveCursorUp()<Enter>
"noremap <buffer> <silent> j :call MoveCursorDown()<Enter>
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> ^ g^
noremap <buffer> <silent> $ g$
noremap <buffer> <silent> I g^i
nnoremap <buffer> <silent> A :call MarkdownCapitalA()<Escape>a

function MoveCursorUp()
    let l:screenlinenum = screenrow()
    let l:scrolloff = 10
    if l:screenlinenum + 1 <= l:scrolloff
        call win_execute(win_getid(winnr()), "normal \<C-y>")
    endif
    normal gk
endfunction

function MoveCursorDown()
    let l:screenlinenum = screenrow()
    let l:winheight = winheight(0)
    let l:scrolloff = 10
    if l:screenlinenum >= l:winheight - l:scrolloff
        if line('.') < line('$')
            call win_execute(win_getid(winnr()), "normal \<C-e>")
        endif
    endif
    normal gj
endfunction

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
        hi WinSeparator guifg=background guibg=background
    endif
endfunction

function s:TableFormat()
    let l:pos = getpos('.')
    normal! {
    " Search instead of `normal! j` because of the table at beginning of file edge case.
    call search('|')
    normal! j
    " Remove everything that is not a pipe, colon or hyphen next to a colon othewise
    " well formated tables would grow because of addition of 2 spaces on the separator
    " line by Tabularize /|.
    let l:flags = (&gdefault ? '' : 'g')
    execute 's/\(:\@<!-:\@!\|[^|:-]\)//e' . l:flags
    execute 's/--/-/e' . l:flags
    Tabularize /|
    " Move colons for alignment to left or right side of the cell.
    execute 's/:\( \+\)|/\1:|/e' . l:flags
    execute 's/|\( \+\):/|:\1/e' . l:flags
    execute 's/ /-/' . l:flags
    call setpos('.', l:pos)
endfunction

augroup markdown
    autocmd!
    au InsertLeave *.md     if s:IsFirstDisplayColumn()
                        \ |     call s:MoveCursorRight()
                        \ | endif
    " au VimEnter *.md        call s:MakeRightGutter()
augroup END

command -buffer TableFormat call s:TableFormat()

