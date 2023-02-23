; (macro_invocation
;   (token_tree) @rust)

; ((macro_invocation
;   (token_tree) @injection.content)
;  (#set! injection.language "rust")
;  (#set! injection.include-children))

; ((macro_rule
;   (token_tree) @injection.content)
;  (#set! injection.language "rust")
;  (#set! injection.include-children))

;((doc_comment) @markdown (#offset! @markdown 0 4 0 0))

;((outer_doc_comment) @markdown)
;((inner_doc_comment) @markdown)

(call_expression
  function: (scoped_identifier
    path: (identifier) @_regex (#eq? @_regex "Regex")
    name: (identifier) @_new (#eq? @_new "new"))
  arguments: (arguments
    (raw_string_literal) @regex))

(call_expression
  function: (scoped_identifier
    path: (scoped_identifier (identifier) @_regex (#eq? @_regex "Regex").)
    name: (identifier) @_new (#eq? @_new "new"))
  arguments: (arguments
    (raw_string_literal) @regex))
