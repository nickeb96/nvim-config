
; TODO: Assignment operator in enum definition

; Identifiers

((identifier) @variable (#lua-match? @variable "[a-z_][a-z0-9_]*"))

; Literals
(boolean_literal) @boolean
(integer_literal) @number
(float_literal) @float

(raw_string_literal) @string
(string_literal) @string
(escape_sequence) @string.escape

(char_literal) @character

(self) @variable.builtin

(field_identifier) @field
(field_expression field: (integer_literal) @field)

; Types
(type_identifier) @type
((type_identifier) @type.builtin (#eq? @type.builtin "Self"))
((identifier) @type (#lua-match? @type "^[A-Z][A-Za-z0-9]*[a-z0-9]$") (#lua-match? @type "[a-z]"))
((identifier) @type.builtin (#eq? @type.builtin "Self"))

(primitive_type) @type.builtin

(pointer_type ["*" "const"] @storageclass)
(mutable_specifier) @storageclass
(reference_type "&" @storageclass)
(self_parameter "&" @storageclass)
(reference_pattern "&" @storageclass)
(ref_pattern "ref" @storageclass)

(lifetime "'" @type.definition (identifier) @type.definition)

; Constants
((identifier) @constant (#lua-match? @constant "^[A-Z][A-Z0-9_]*$"))

(mod_item name: (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))

; Path components
(scoped_identifier path: [(self) (super) (crate)] @namespace.special)
(scoped_identifier path: (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))
(scoped_identifier path: ((identifier) @type.builtin (#any-of? @type.builtin
        "u8" "i8" "u16" "i16" "u32" "i32" "u64" "i64" "u128" "i128"
        "isize" "usize" "f32" "f64" "bool" "char" "str")))
(use_declaration argument: (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))
(use_wildcard [(self) (super) (crate)] @namespace.special)
(use_wildcard (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))

; Path ending
(scoped_identifier name: (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))
(use_wildcard "*" @include)

(scoped_use_list path: [(self) (super) (crate)] @namespace.special)
(scoped_use_list path: (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))

(scoped_type_identifier path: [(self) (super) (crate)] @namespace.special)
(scoped_type_identifier path: (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))

; Path use list contents
(use_list [(self) (super)] @namespace.special)
(use_list (identifier) @namespace (#lua-match? @namespace "^[a-z][a-z0-9_]*$"))


; Functions
(function_item name: (identifier) @function)
(function_signature_item (identifier) @function)

(call_expression function: ((identifier) @function (#lua-match? @function "^[a-z][a-z0-9_]*$")))
(call_expression function: (scoped_identifier ((identifier) @function (#lua-match? @function "^[a-z][a-z0-9_]*$"))))

(call_expression
  function: (scoped_identifier
              path: ((identifier) @type.builtin
                                  (#any-of? @type.builtin
                                   "u8"
                                   "i8"
                                   "u16"
                                   "i16"
                                   "u32"
                                   "i32"
                                   "u64"
                                   "i64"
                                   "u128"
                                   "i128"
                                   "isize"
                                   "usize"
                                   "f32"
                                   "f64"
                                   "bool"
                                   "char"
                                   "str"
                                   ))))

(call_expression function: (field_expression field: (field_identifier) @function))

(generic_function function: (identifier) @function)
(generic_function function: (scoped_identifier name: (identifier) @function))
(generic_function function: (field_expression field: (field_identifier) @function))

(function_modifiers) @keyword.function

(closure_expression "move" @keyword.function)


; Macros
(macro_invocation macro: (identifier) @function.macro)
(macro_invocation macro: (scoped_identifier name: (identifier) @function.macro))
(macro_invocation "!" @function.macro)


; Keywords

["use" "mod"] @include
(use_as_clause "as" @include)

[
  "async"
  "await"
  "default"
  "dyn"
  "enum"
  "extern"
  "impl"
  "let"
  "match"
  "pub"
  "static"
  "struct"
  "trait"
  "try"
  "type"
  "union"
  "unsafe"
  "where"
] @keyword
(const_item "const" @keyword)
(const_parameter "const" @keyword)

"fn" @keyword.function
["return" "yield"] @keyword.return

(type_cast_expression "as" @keyword.operator)
(qualified_type "as" @keyword.operator)

[
  "if"
  "else"
] @conditional

[
  "loop"
  "while"
  "for"
  "in"
  "break"
  "continue"
] @repeat



;;; Operators & Punctuation

(binary_expression [
  "+"
  "-"
  "*"
  "/"
  "%"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&"
  "|"
  "^"
  "<<"
  ">>"
  "&&"
  "||"
] @operator)

(compound_assignment_expr [
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "<<="
  ">>="
] @operator)

(assignment_expression "=" @operator)

; TODO: figure out why this doesn't work
;(macro_invocation
;  macro: ((identifier) @function.macro (#lua-match? @function.macro "^println$"))
;  "!"
;  (token_tree "=" @punctuation.delimiter)
;  )

(let_declaration "=" @operator)
(if_let_expression "=" @operator)
(let_else_expression "=" @operator)
(const_item "=" @operator)
(static_item "=" @operator)
(type_item "=" @operator)

(enum_variant "=" @operator)

(type_binding "=" @punctuation.delimiter) ; i.e. IntoIterator<Item=i32>

(unary_expression "*" @storageclass)
(reference_expression "&" @storageclass)

(unary_expression ["!" "-"] @operator)

(try_expression "?" @operator)

(range_expression [".." "..="] @operator)
(range_pattern [".." "..="] @operator)


(line_comment) @comment
(block_comment) @comment

;(line_comment @todo (#lua-match? @todo "TODO"))
;(block_comment "TODO" @todo)

;(call_expression
;  arguments: (arguments ")" @punctuation.bracket))


["(" ")" "[" "]" "{" "}"]  @punctuation.bracket
(closure_parameters "|"    @punctuation.bracket)
(type_arguments  ["<" ">"] @punctuation.bracket)
(type_parameters ["<" ">"] @punctuation.bracket)


["," "." ":" "::" ";"] @punctuation.delimiter

(remaining_field_pattern) @punctuation.delimiter
(function_item "->" @punctuation.delimiter)
(match_arm "=>" @punctuation.delimiter)
(or_pattern "|" @punctuation.delimiter)
(captured_pattern "@" @punctuation.delimiter)

[(attribute_item) (inner_attribute_item)] @attribute
(attribute_item ["[" "]"] @attribute)
(inner_attribute_item ["[" "]"] @attribute)
(meta_arguments ["(" ")"] @attribute)
(meta_item (_) @attribute)
(attr_item (_) @attribute)
(attr_item (scoped_identifier path: (_) @attribute name: (_) @attribute))
(attr_item (scoped_identifier
             path: (scoped_identifier path: (_) @attribute name: (_) @attribute)
             name: (_) @attribute))

(empty_type "!" @type.builtin)

