

" For version 5.x: Clear all syntax items
" For versions greater than 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


" Enable option if it's not defined
function! s:EnableByDefault(name)
  if !exists(a:name)
    let {a:name} = 1
  endif
endfunction

" Check if option is enabled
function! s:Enabled(name)
  return exists(a:name) && {a:name}
endfunction


"
" Default options
"

call s:EnableByDefault("g:python_slow_sync")

if s:Enabled("g:python_highlight_all")
  call s:EnableByDefault("g:python_highlight_builtins")
  if s:Enabled("g:python_highlight_builtins")
    call s:EnableByDefault("g:python_highlight_builtin_objs")
    call s:EnableByDefault("g:python_highlight_builtin_funcs")
  endif
  call s:EnableByDefault("g:python_highlight_exceptions")
  call s:EnableByDefault("g:python_highlight_string_formatting")
  call s:EnableByDefault("g:python_highlight_string_format")
  call s:EnableByDefault("g:python_highlight_string_templates")
  call s:EnableByDefault("g:python_highlight_indent_errors")
  call s:EnableByDefault("g:python_highlight_space_errors")
  call s:EnableByDefault("g:python_highlight_doctests")
  call s:EnableByDefault("g:python_print_as_function")
endif

"
" Keywords
"

syn keyword pythonStatement     break continue del
syn keyword pythonStatement     return
syn keyword pythonStatement     pass raise
syn keyword pythonStatement     global assert
syn keyword pythonStatement     lambda
syn keyword pythonStatement     with
syn match   pythonStatement     "\<def\>" nextgroup=pythonFunction skipwhite
syn match   pythonStatement     "\<class\>" nextgroup=pythonClass skipwhite
syn keyword pythonRepeat        for while
syn keyword pythonConditional   if elif else
syn keyword pythonException     try except finally
syn keyword pythonOperator      and in is not or

syn match pythonStatement   "\<yield\>" display
syn match pythonImport      "\<from\>" display
syn match pythonImport      "\<import\>" display

syn keyword pythonStatement   nonlocal as
syn match   pythonStatement   "\<yield\s\+from\>" display
syn keyword pythonBoolean     True False
syn match   pythonFunction    "[a-z_][a-zA-Z0-9_]*" display contained
syn match   pythonClass       "[A-Z_][A-Za-z0-9]*" display contained
"syn match   pythonConstant    "[A-Z_][A-Z0-9_]\{1,\}" display
syn keyword pythonStatement   await
syn match   pythonStatement   "\<async\s\+def\>" nextgroup=pythonFunction skipwhite
syn match   pythonStatement   "\<async\s\+with\>" display
syn match   pythonStatement   "\<async\s\+for\>" display

"
" Decorators (new in Python 2.4)
"

syn match   pythonDecorator	"@" display nextgroup=pythonDottedName skipwhite
syn match   pythonDottedName	"[A-Za-z_][A-Za-z0-9_]*\%(\.[A-Za-z_][A-Za-z0-9_]*\)*" display contained
syn match   pythonDot        "\." display containedin=pythonDottedName

"
" Comments
"

syn match   pythonComment	"#.*$" display contains=pythonTodo,@Spell
syn keyword pythonTodo		TODO FIXME XXX contained

"
" Errors
"

syn match pythonError		"\<\d\+\D\+\>" display
syn match pythonError		"[$?]" display
syn match pythonError		"[&|]\{2,}" display
syn match pythonError		"[=]\{3,}" display

" Mixing spaces and tabs also may be used for pretty formatting multiline
" statements
syn match pythonIndentError	"^\s*\%( \t\|\t \)\s*\S"me=e-1 display

" Trailing space errors
syn match pythonSpaceError	"\s\+$" display

"
" Strings
"

" Python 3 byte strings
syn region pythonBytes		start=+[bB]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
syn region pythonBytes		start=+[bB]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
syn region pythonBytes		start=+[bB]"""+ end=+"""+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonBytes		start=+[bB]'''+ end=+'''+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest,pythonSpaceError,@Spell

syn match pythonBytesError    ".\+" display contained
syn match pythonBytesContent  "[\u0000-\u00ff]\+" display contained contains=pythonBytesEscape,pythonBytesEscapeError

syn match pythonBytesEscape       +\\[abfnrtv'"\\]+ display contained
syn match pythonBytesEscape       "\\\o\o\=\o\=" display contained
syn match pythonBytesEscapeError  "\\\o\{,2}[89]" display contained
syn match pythonBytesEscape       "\\x\x\{2}" display contained
syn match pythonBytesEscapeError  "\\x\x\=\X" display contained
syn match pythonBytesEscape       "\\$"

syn match pythonUniEscape         "\\u\x\{4}" display contained
syn match pythonUniEscapeError    "\\u\x\{,3}\X" display contained
syn match pythonUniEscape         "\\U\x\{8}" display contained
syn match pythonUniEscapeError    "\\U\x\{,7}\X" display contained
syn match pythonUniEscape         "\\N{[A-Z ]\+}" display contained
syn match pythonUniEscapeError    "\\N{[^A-Z ]\+}" display contained

" Python 3 strings
syn region pythonString   start=+[fF]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonString   start=+[fF]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region pythonString   start=+[fF]\="""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonString   start=+[fF]\='''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell


" Python 3 raw strings
syn region pythonRawString  start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString  start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString  start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
syn region pythonRawString  start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

syn region pythonRawBytes  start=+[bB][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawBytes  start=+[bB][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawBytes  start=+[bB][rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
syn region pythonRawBytes  start=+[bB][rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

syn match pythonRawEscape +\\['"]+ display transparent contained

if s:Enabled("g:python_highlight_string_formatting")
  " % operator string formatting
  syn match pythonStrFormatting	"%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
  syn match pythonStrFormatting	"%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
endif

if s:Enabled("g:python_highlight_string_format")
  " str.format syntax
  syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonRawString
  syn match pythonStrFormat	"{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonRawString
endif

if s:Enabled("g:python_highlight_string_templates")
  " string.Template format
  syn match pythonStrTemplate	"\$\$" contained containedin=pythonString,pythonRawString
  syn match pythonStrTemplate	"\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonRawString
  syn match pythonStrTemplate	"\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonRawString
endif

if s:Enabled("g:python_highlight_doctests")
  " DocTests
  syn region pythonDocTest	start="^\s*>>>" end=+'''+he=s-1 end="^\s*$" contained
  syn region pythonDocTest2	start="^\s*>>>" end=+"""+he=s-1 end="^\s*$" contained
endif

"
" Numbers (ints, longs, floats, complex)
"
syn match   pythonHexError	"\<0[xX]\x*[g-zG-Z]\x*\>" display
syn match   pythonOctError	"\<0[oO]\=\o*\D\+\d*\>" display
syn match   pythonBinError	"\<0[bB][01]*\D\+\d*\>" display

syn match   pythonHexNumber	"\<0[xX]\x\+\>" display
syn match   pythonOctNumber "\<0[oO]\o\+\>" display
syn match   pythonBinNumber "\<0[bB][01]\+\>" display

syn match   pythonNumberError	"\<\d\+\D\>" display
syn match   pythonNumberError	"\<0\d\+\>" display
syn match   pythonNumber	"\<\d\>" display
syn match   pythonNumber	"\<[1-9]\d\+\>" display
syn match   pythonNumber	"\<\d\+[jJ]\>" display

syn match   pythonOctError	"\<0[oO]\=\o*[8-9]\d*\>" display
syn match   pythonBinError	"\<0[bB][01]*[2-9]\d*\>" display

syn match   pythonFloat		"\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match   pythonFloat		"\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match   pythonFloat		"\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=" display

"
" Builtin objects and types
"

syn keyword pythonBuiltinObj	Ellipsis NotImplemented None

"
" Builtin functions
"

syn keyword pythonBuiltinFunc	ascii exec memoryview print
syn keyword pythonBuiltinFunc	abs all any
syn keyword pythonBuiltinFunc	bin bool breakpoint bytearray bytes
syn keyword pythonBuiltinFunc	callable chr classmethod compile complex
syn keyword pythonBuiltinFunc	delattr dict dir divmod enumerate eval
syn keyword pythonBuiltinFunc	filter float format frozenset getattr
syn keyword pythonBuiltinFunc	globals hasattr hash hex id
syn keyword pythonBuiltinFunc	input int isinstance
syn keyword pythonBuiltinFunc	issubclass iter len list locals map max
syn keyword pythonBuiltinFunc	min next object oct open ord
syn keyword pythonBuiltinFunc	pow property range
syn keyword pythonBuiltinFunc	repr reversed round set setattr
syn keyword pythonBuiltinFunc	slice sorted staticmethod str sum super tuple
syn keyword pythonBuiltinFunc	type vars zip

"
" exceptions and warnings
"

syn match pythonExClass "\<[A-Z][A-Za-z0-9_]*Error\>"
syn keyword pythonExClass BaseException Exception

syn match pythonWarnClass "\<[A-Z][A-Za-z0-9_]*Warning\>"
syn keyword pythonWarnClass Warning
syn keyword pythonWarnClass GeneratorExit KeyboardInterrupt
syn keyword pythonWarnClass StopIteration SystemExit


if s:Enabled("g:python_slow_sync")
  syn sync minlines=2000
else
  " This is fast but code inside triple quoted strings screws it up. It
  " is impossible to fix because the only way to know if you are inside a
  " triple quoted string is to start from the beginning of the file.
  syn sync match pythonSync grouphere NONE "):$"
  syn sync maxlines=200
endif

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pythonStatement        Statement
  HiLink pythonImport           Include
  HiLink pythonFunction         Function
  HiLink pythonClass            StorageClass
  HiLink pythonConditional      Conditional
  HiLink pythonRepeat           Repeat
  HiLink pythonException        Exception
  HiLink pythonOperator         Operator

  HiLink pythonDecorator        Define
  HiLink pythonDottedName       Function
  HiLink pythonDot              Normal

  HiLink pythonComment          Comment
  HiLink pythonTodo             Todo

  HiLink pythonError            Error
  HiLink pythonIndentError      Error
  HiLink pythonSpaceError       Error

  HiLink pythonString           String
  HiLink pythonRawString        String

  HiLink pythonUniEscape        Special
  HiLink pythonUniEscapeError   Error

  HiLink pythonBytes              String
  HiLink pythonRawBytes           String
  HiLink pythonBytesContent       String
  HiLink pythonBytesError         Error
  HiLink pythonBytesEscape        Special
  HiLink pythonBytesEscapeError   Error

  HiLink pythonStrFormatting    Special
  HiLink pythonStrFormat        Special
  HiLink pythonStrTemplate      Special

  HiLink pythonDocTest          Special
  HiLink pythonDocTest2         Special

  HiLink pythonNumber           Number
  HiLink pythonHexNumber        Number
  HiLink pythonOctNumber        Number
  HiLink pythonBinNumber        Number
  HiLink pythonFloat            Float
  HiLink pythonNumberError      Error
  HiLink pythonOctError         Error
  HiLink pythonHexError         Error
  HiLink pythonBinError         Error

  HiLink pythonBoolean          Boolean
  HiLink pythonConstant         Identifier

  HiLink pythonBuiltinObj       Structure
  HiLink pythonBuiltinFunc      Function

  HiLink pythonExClass          Structure
  HiLink pythonWarnClass        pythonExClass

  delcommand HiLink
endif

let b:current_syntax = "python"
