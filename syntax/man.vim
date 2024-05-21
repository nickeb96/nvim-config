" Maintainer:          Anmol Sethi <hi@nhooyr.io>
" Previous Maintainer: SungHyun Nam <goweol@gmail.com>

if exists('b:current_syntax')
  finish
endif

syntax case  ignore
syntax match manReference      display '[^()[:space:]]\+(\%([0-9][a-z]*\|[nlpox]\))'
syntax match manSectionHeading display '^\S.*$'
syntax match manHeader         display '^\%1l.*$'
syntax match manSubHeading     display '^ \{3\}\S.*$'
syntax match manOption         display '\<-[a-zA-Z0-9_-]\+'

highlight default link manHeader            @markup.heading.1
highlight default link manSectionHeading    @markup.heading.3
highlight default link manOption            @markup.raw
highlight default link manReference         @markup.link.reference
highlight default link manSubHeading        @markup.heading.5

highlight default link manItalic            @markup.italic
highlight default link manBold              @markup.bold
highlight default link manUnderline         @markup.underline

if &filetype != 'man'
  " May have been included by some other filetype.
  finish
endif

if get(b:, 'man_sect', '') =~# '^[023]'
  syntax case match
  syntax include @c $VIMRUNTIME/syntax/c.vim
  syntax match manCFuncDefinition display '\<\h\w*\>\ze\(\s\|\n\)*(' contained
  syntax match manLowerSentence /\n\s\{7}\l.\+[()]\=\%(\:\|.\|-\)[()]\=[{};]\@<!\n$/ display keepend contained contains=manReference
  syntax region manSentence start=/^\s\{7}\%(\u\|\*\)[^{}=]*/ end=/\n$/ end=/\ze\n\s\{3,7}#/ keepend contained contains=manReference
  syntax region manSynopsis start='^\%(
        \SYNOPSIS\|
        \SYNTAX\|
        \SINTASSI\|
        \SKŁADNIA\|
        \СИНТАКСИС\|
        \書式\)$' end='^\%(\S.*\)\=\S$' keepend contains=manLowerSentence,manSentence,manSectionHeading,@c,manCFuncDefinition
  highlight default link manCFuncDefinition Function

  syntax region manExample start='^EXAMPLES\=$' end='^\%(\S.*\)\=\S$' keepend contains=manLowerSentence,manSentence,manSectionHeading,manSubHeading,@c,manCFuncDefinition

  " XXX: groupthere doesn't seem to work
  syntax sync minlines=500
  "syntax sync match manSyncExample groupthere manExample '^EXAMPLES\=$'
  "syntax sync match manSyncExample groupthere NONE '^\%(EXAMPLES\=\)\@!\%(\S.*\)\=\S$'
endif

" Prevent everything else from matching the last line
execute 'syntax match manFooter display "^\%'.line('$').'l.*$"'

let b:current_syntax = 'man'
