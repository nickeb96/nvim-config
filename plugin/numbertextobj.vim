if exists("g:loaded_number_textobj") || v:version < 700
  finish
endif
let g:loaded_number_textobj = 1

function NumberTextObject(around)
    let l:hex_pattern = '<0x[0-9a-f_]+'
    let l:oct_pattern = '<0o[0-7_]+'
    let l:bin_pattern = '<0b[01_]+'
    let l:dec_pattern = '[+-]?<[0-9]([0-9_,]*[0-9_])?(\.[0-9_]*)?([eE][+-]?[0-9_]+)?'
    let l:full_pattern = '\v'
        \ .. l:hex_pattern .. '|'
        \ .. l:oct_pattern .. '|'
        \ .. l:bin_pattern .. '|'
        \ .. l:dec_pattern
    let l:col = col('.')
    let [_, l:start] = searchpos(l:full_pattern, 'bcnW', line('.'))
    let [_, l:end] = searchpos(l:full_pattern, 'cenW', line('.'))
    if l:start != 0 && l:end != 0 && l:start <= l:col && l:col <= l:end
        let l:subregion = matchstr(getline('.'), l:full_pattern, l:start - 1)
        if len(l:subregion) == l:end - l:start + 1
            if a:around
                let l:has_trailing_ws = 0
                while l:end < len(getline('.')) && getline('.')[l:end] ==# ' '
                    let l:end += 1
                    let l:has_trailing_ws = 1
                endwhile
                if !l:has_trailing_ws
                    while l:start > 1 && getline('.')[l:start - 2] ==# ' '
                        let l:start -= 1
                    endwhile
                endif
            endif
            call setpos('.', [0, line('.'), l:start, 0])
            normal! v
            call setpos('.', [0, line('.'), l:end, 0])
        endif
    endif
endfunction

vnoremap <silent> in :<C-U>call NumberTextObject(0)<Enter>
omap in :normal vin<Enter>

vnoremap <silent> an :<C-U>call NumberTextObject(1)<Enter>
omap an :normal van<Enter>
