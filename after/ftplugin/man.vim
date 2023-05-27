if 1
    finish
endif

augroup fixcursorinmanpages
    autocmd!
    au VimEnter <buffer> setlocal scrolloff=0
        \ | call setpos('.', [0, winheight('.'), 1, 0])
    au WinScrolled <buffer> call setpos('.', [0, winsaveview().topline + winheight('.') - 1, 1, 0])
    au VimEnter <buffer> setlocal guicursor=a:hor20
    au ModeChanged *:n setlocal guicursor=a:hor20
augroup END

let g:desired_scrolloff=0

setlocal laststatus=0
setlocal cmdheight=0
setlocal scrolloff=0
let &scroll = g:desired_scroll

"" this breaks other normal commands
" function ConditionalScrollForMan()
"     if winsaveview().topline + winheight('.') < line('$')
"         normal <C-e>
"     endif
" endfunction

" nmap <buffer> j :call ConditionalScrollForMan()<Enter>
nmap <buffer> <silent> j <C-e>
nmap <buffer> <silent> k <C-y>

nmap <buffer> <silent> <C-d> :exe 'normal '..&scroll..'j'<Enter>
nmap <buffer> <silent> <C-u> :exe 'normal '..&scroll..'k'<Enter>

nmap <buffer> <silent> <Space> :exe 'normal '..(winheight('.') - 2)..'j'<Enter>
nmap <buffer> <silent> b :exe 'normal '..(winheight('.') - 2)..'k'<Enter>

function ConditionalGotoForMan()
    if line('.') > winheight('.')
        exec '0goto'
    endif
endfunction

nmap <buffer> <silent> <nowait> g :call ConditionalGotoForMan()<Enter>

nmap <buffer> i <nop>
nmap <buffer> I <nop>
nmap <buffer> a <nop>
nmap <buffer> A <nop>
nmap <buffer> o <nop>
nmap <buffer> O <nop>
nmap <buffer> s <nop>
nmap <buffer> S <nop>
nmap <buffer> x <nop>
nmap <buffer> c <nop>
nmap <buffer> d <nop>
nmap <buffer> r <nop>
nmap <buffer> <C-r> <nop>
nmap <buffer> u <nop>

