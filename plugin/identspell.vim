
if exists("g:loaded_identspell") || v:version < 700
  finish
endif
let g:loaded_identspell = 1

function s:split_identifier(identifier)
    " split on one of:
    "   _ (literal underscore)
    "   \u (uppercase letter) '\zs' and '\ze' to set match bounds
    "   \d+ (one or more digits)
    return split(a:identifier, '_\|\U\zs\ze\u\|\d\+')
endfunction

function s:check_identifier(identifier)
    let l:words = s:split_identifier(a:identifier)
    for l:word in l:words
        let [_, l:status] = spellbadword(toupper(l:word))
        if l:status ==# 'bad'
            echohl DiagnosticError
            echon l:word
            echohl Normal
            echon ' '
        else
            echohl DiagnosticOk
            echon l:word
            echohl Normal
            echon ' '
        endif
    endfor
endfunction

function s:suggest_correct(identifier)
    let l:words = s:split_identifier(a:identifier)
    for l:word in l:words
        call s:spell_check(l:word, 1)
    endfor
endfunction

function s:spell_check(word, ignore_case)
    if a:ignore_case
        let [_, l:status] = spellbadword(toupper(a:word))
    else
        let [_, l:status] = spellbadword(a:word)
    endif
    if l:status ==# 'bad'
        echohl DiagnosticError
        echo a:word
        echohl Normal
        echon ' -> '
        let l:suggestions = spellsuggest(a:word)
        let l:available_width = v:echospace - (strlen(a:word) + 4)
        if len(l:suggestions) > 0
            echohl DiagnosticHint
            echon l:suggestions[0]
            let l:available_width -= strlen(l:suggestions[0])
        endif
        for l:sugg in l:suggestions[1:]
            if l:available_width > strlen(l:sugg) + 2
                let l:available_width -= strlen(l:sugg) + 2
                echohl Normal
                echon ', '
                echohl DiagnosticHint
                echon l:sugg
            else
                break
            endif
        endfor
    else
        echohl DiagnosticOk
        echo a:word
    endif
endfunction

command! -nargs=1 SpellCheck call s:spell_check('<args>', 0)
command! IdentSpellCheck call s:check_identifier(expand('<cword>'))
command! IdentSpellSuggest call s:suggest_correct(expand('<cword>'))

nnoremap <silent> gs :IdentSpellCheck<Enter>
nnoremap <silent> gS :IdentSpellSuggest<Enter>

