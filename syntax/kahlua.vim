if exists("b:current_syntax")
    finish
endif

syn keyword kahluaKeyword end static let return
syn keyword kahluaKeyword function nextgroup=kahluaFunction skipwhite
syn keyword kahluaConditional if then elseif else
syn keyword kahluaRepeat while do for in
syn keyword kahluaOperator and or not

syn match kahluaOperator /=/
syn match kahluaOperator /+/
syn match kahluaOperator /-/
syn match kahluaOperator /*/
syn match kahluaOperator /\//
syn match kahluaOperator /%/
syn match kahluaOperator /==/
syn match kahluaOperator /!=/
syn match kahluaOperator /</
syn match kahluaOperator />/
syn match kahluaOperator /<=/
syn match kahluaOperator />=/

syn match kahluaIdentifier /\<[a-zA-Z_][a-zA-Z0-9_]*\>/
syn match kahluaFunction /\<[a-zA-Z_][a-zA-Z0-9_]*\>/ contained

syn match kahluaFunctionCall /\<[a-zA-Z_][a-zA-Z0-9_]*(/ contains=kahluaFunction,kahluaDelimiter

syn region kahluaString start='"' skip='\\"' end='"'
syn match kahluaInteger /\<[0-9][0-9_]*\>/
syn match KahluaFloat /\<[0-9][0-9_]*\.[0-9_]\+\>/
syn keyword kahluaBoolean true false
syn keyword kahluaNil nil

syn match kahluaDelimiter /\./
syn match kahluaDelimiter /,/
syn match kahluaDelimiter /(/
syn match kahluaDelimiter /)/
syn match kahluaDelimiter /{/
syn match kahluaDelimiter /}/
syn match kahluaDelimiter /\[/
syn match kahluaDelimiter /\]/

syn region kahluaComment start=/#/ end=/$/


hi def link kahluaKeyword       Keyword
hi def link kahluaConditional   Conditional
hi def link kahluaRepeat        Repeat
hi def link kahluaOperator      Operator
hi def link kahluaIdentifier    Identifier
hi def link kahluaFunction      Function
hi def link kahluaString        String
hi def link kahluaInteger       Number
hi def link kahluaFloat         Number
hi def link kahluaBoolean       Boolean
hi def link kahluaNil           Constant
hi def link kahluaDelimiter     Delimiter
hi def link kahluaComment       Comment

