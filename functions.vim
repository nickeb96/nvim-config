
" list syntax groups of text under cursor
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <C-H> :call SynStack()<CR>


" format markdown tables
function! s:TableFormat()
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
command! -buffer TableFormat call s:TableFormat()


" paste helper from mac clipboard pbpaste command
function! s:PBPaste()
    set paste
    read !pbpaste
    set nopaste
endfunction
command! -buffer PBPaste call s:PBPaste()


" custom auto creation of html tag attributes
function HtmlAttribCallback( xml_tag )
    return 0
endfunction

function MySpecialFunction()
    "vsplit
    "wincmd w
    "vertical resize 18
endfunction
