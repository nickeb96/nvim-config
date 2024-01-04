
; vim: foldmethod=marker foldlevel=2 foldcolumn=0



;;;; Punctuation TODO

; ["[" "]"] @punctuation.bracket
["." "::" ";"] @punctuation.delimiter

(declaration_list
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(block
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(match_block
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(match_arm
  "=>" @punctuation.delimiter
  ","? @punctuation.delimiter)

("_" @keyword)
(label "'" @label (identifier) @label)
(while_expression ":" @punctuation.delimiter)
(for_expression ":" @punctuation.delimiter)
(loop_expression ":" @punctuation.delimiter)
(block ":" @punctuation.delimiter)


;;;; idk, figure out wtf this is (TODO)
(macro_invocation (identifier) @function.macro)
(macro_invocation (scoped_identifier
                    name: (identifier) @function.macro))
(macro_invocation "!" @function.macro)

(macro_invocation
  (token_tree ["," "(" ")" "[" "]" "{" "}"] @punctuation.bracket))



;;;; Visibility

(visibility_modifier
  "pub" @keyword)

(visibility_modifier
  ["(" ")"] @punctuation.bracket)

(visibility_modifier
  [(crate) (super) (self)] @namespace.builtin)

(visibility_modifier
  "in" @keyword)

;;;; Modules

(mod_item
  "mod" @include
  name: (identifier) @namespace)

(foreign_mod_item
  (extern_modifier
    "extern" @include))

(extern_crate_declaration
  "extern" @include
  (crate) @include
  (identifier) @namespace
  "as"? @include
  (identifier) @namespace)




;;;; Paths

; crate::...
(scoped_identifier
  path: [(crate) (super) (self)] @namespace.builtin)
(scoped_type_identifier
  path: [(crate) (super) (self)] @namespace.builtin)

; this::...
(scoped_identifier
  path: (identifier) @namespace)
(scoped_type_identifier
  path: (identifier) @namespace)

; ...::this::...
(scoped_identifier
  path: (scoped_identifier
          name: (identifier) @namespace))
(scoped_type_identifier
  path: (scoped_identifier
          name: (identifier) @namespace))


;;;; Imports

; use ...;
(use_declaration
  "use" @include)

; use this;
(use_declaration
  argument: (identifier) @namespace)

; use this::*;
(use_wildcard
  (identifier) @namespace
  "*" @include)

; use crate::*;
(use_wildcard
  [(crate) (super) (self)] @namespace.builtin
  "*" @include)

; use ...::this::*;
(use_wildcard
  (scoped_identifier
    name: (identifier) @namespace)
  "*" @include)

; use crate::{...};
(scoped_use_list
  path: [(crate) (super) (self)] @namespace.builtin)

; use this::{...};
(scoped_use_list
  path: (identifier) @namespace)

; use ...::this::{...};
(scoped_use_list
  path: (scoped_identifier
          name: (identifier) @namespace))

; use ...::{self};
(use_list
  [(super) (self)] @namespace.builtin)

(use_list
  "{" @punctuation.bracket
  ","? @punctuation.delimiter
  "}" @punctuation.bracket)

; use ... as ...;
(use_as_clause
  "as" @include)





;;;; Keywords





(const_block "const" @keyword)


(unsafe_block "unsafe" @keyword)
(async_block "async" @keyword.coroutine "move"? @keyword)



;;;; Types

(type_identifier) @type

(primitive_type) @type.builtin

(empty_type "!" @type.builtin)

(unit_type ["(" ")"] @type.builtin)

(tuple_type ["(" ")"] @punctuation.bracket)
(tuple_type "," @punctuation.delimiter)

(array_type ["[" "]"] @punctuation.bracket)
(array_type ";" @punctuation.delimiter)

((type_identifier) @type.builtin (#eq? @type.builtin "Self"))
((identifier) @type.builtin (#eq? @type.builtin "Self"))

(qualified_type "as" @keyword)


;;;; Type Declarations

(struct_item
  "struct" @keyword
  name: (type_identifier) @type.struct)

(union_item
  "union" @keyword
  name: (type_identifier) @type.union)

(field_declaration_list
  "{" @punctuation.bracket
  ","? @punctuation.delimiter
  "}" @punctuation.bracket)

(field_declaration
  ":" @punctuation.delimiter)

(ordered_field_declaration_list
  "(" @punctuation.bracket
  ","? @punctuation.delimiter
  ")" @punctuation.bracket)

(enum_item
  "enum" @keyword
  name: (type_identifier) @type.enum)

(enum_variant_list
  "{" @punctuation.bracket
  ","? @punctuation.delimiter
  "}" @punctuation.bracket)

(enum_variant
  name: (identifier) @type.enum.variant
  "="? @punctuation.delimiter)

(type_item
  "type" @keyword
  name: (type_identifier) @type.definition
  "=" @punctuation.delimiter)

(associated_type
  "type" @keyword
  name: (type_identifier) @type.definition)

(trait_item
  "unsafe"? @keyword
  "trait" @keyword
  name: (type_identifier) @type.interface)


;;;; Implementation Blocks

; impl Type
(impl_item
  "impl" @keyword)

; impl Trait for Type
(impl_item
  "unsafe"? @keyword
  "impl" @keyword
  "!"? @keyword.operator
  trait: [(type_identifier) @type.interface
          (scoped_type_identifier
            name: (type_identifier) @type.interface)
          (generic_type
            type: (type_identifier) @type.interface)
          (generic_type
            type: (scoped_type_identifier
                    name: (type_identifier) @type.interface))]
  "for" @keyword)


;;;; Type Parameters and Generics

(type_parameters (type_identifier) @type.parameter)

(where_clause "where" @keyword)

(constrained_type_parameter
  left: (type_identifier) @type.parameter)

; handles:
;   impl Trait
;   impl ...::Trait
;   impl Trait<...>
;   impl ...::Trait<...>
(abstract_type
  "impl" @keyword
  trait: [(type_identifier) @type.interface
          (scoped_type_identifier
            name: (type_identifier) @type.interface)
          (generic_type
            type: (type_identifier) @type.interface)
          (generic_type
            type: (scoped_type_identifier
                    name: (type_identifier) @type.interface))
          (function_type)])

(dynamic_type
  "dyn" @keyword
  trait: [(type_identifier) @type.interface
          (scoped_type_identifier
            name: (type_identifier) @type.interface)
          (generic_type
            type: (type_identifier) @type.interface)
          (generic_type
            type: (scoped_type_identifier
                    name: (type_identifier) @type.interface))
          (function_type)])

(trait_bounds ":" @punctuation.delimiter)

(trait_bounds "+" @punctuation.delimiter)

(trait_bounds (type_identifier) @type.interface)

(removed_trait_bound "?" @keyword.operator)

(type_parameters ["<" ">"] @punctuation.bracket)

(bracketed_type ["<" ">"] @punctuation.bracket)
(for_lifetimes ["<" ">"] @punctuation.bracket)




;;;; Functions

(function_item
  "fn" @keyword.function
  name: (identifier) @function
  "->"? @punctuation.delimiter)

(function_signature_item
  "fn" @keyword.function
  name: (identifier) @function
  "->"? @punctuation.delimiter)

(function_modifiers "unsafe" @keyword.function)
(function_modifiers "async" @keyword.function)
(function_modifiers "const" @keyword.function)
(function_modifiers (extern_modifier "extern" @keyword.function))

(parameters ["(" ")"] @punctuation.bracket)
(parameters "," @punctuation.delimiter)

(function_type
  "fn" @keyword.function)
(function_type
  "->" @punctuation.delimiter)


;;;; Constants / Statics

(const_item
  "const" @keyword
  name: (identifier) @constant
  ":"? @punctuation.delimiter
  "="? @punctuation.delimiter)

(const_parameter
  "const" @keyword
  name: (identifier) @constant.parameter
  ":"? @punctuation.delimiter
  "="? @punctuation.delimiter)

(static_item
  "static" @keyword
  name: (identifier) @constant
  ":"? @punctuation.delimiter
  "="? @punctuation.delimiter)


;;;; Variables

(let_declaration
  "let" @keyword
  ":"? @punctuation.delimiter
  "="? @punctuation.delimiter
  "else"? @keyword)

(let_condition
  "let" @keyword
  "=" @punctuation.delimiter)

(let_chain
  "&&" @operator.logical)

(let_declaration
  pattern: (identifier) @variable)

(parameter
  pattern: (identifier) @parameter)

(parameter
  ":" @punctuation.delimiter)

((field_expression
  field: (field_identifier) @field) @_member
 (#not-has-parent? @_member call_expression))

(field_expression
  field: (integer_literal) @field)

(field_initializer_list
  "{" @punctuation.bracket
  ","? @punctuation.delimiter
  "}" @punctuation.bracket)

(base_field_initializer
  ".." @punctuation.delimiter)

(field_initializer
  (field_identifier) @field
  ":" @punctuation.delimiter)

(shorthand_field_initializer (identifier) @field) ; TODO increase priority or move lower

((self) @variable.builtin
        (#not-has-parent? @variable.builtin scoped_identifier scoped_type_identifier use_list))


;;;; Closures

(closure_expression "move" @keyword)

(closure_parameters "|" @punctuation.bracket)
(closure_parameters "," @punctuation.delimiter)

(closure_expression "->" @punctuation.delimiter)


;;;; References

(lifetime
  "'" @storageclass.lifetime
  (identifier) @storageclass.lifetime)

(mutable_specifier) @storageclass

(pointer_type
  "*" @storageclass)

(pointer_type
  "const" @storageclass)

(reference_type
  "&" @storageclass)

(self_parameter
  "&" @storageclass)


(ref_pattern
  "ref" @storageclass)

(reference_pattern
  "&" @storageclass)

(field_pattern
  "ref" @storageclass)

(reference_expression
  "&" @storageclass)

(unary_expression
  "*" @storageclass)


;;;; Patterns

(tuple_pattern
  ["(" ")"] @punctuation.bracket)
(tuple_pattern
  "," @punctuation.delimiter)

(tuple_struct_pattern
  type: [(identifier) @type.struct
         (scoped_identifier
           name: (identifier) @type.struct)])
(tuple_struct_pattern
  ["(" ")"] @punctuation.bracket)
(tuple_struct_pattern
  "," @punctuation.delimiter)

(struct_pattern
  type: [(type_identifier) @type.struct
         (scoped_type_identifier
           name: (type_identifier) @type.struct)])
(struct_pattern
  ["{" "}"] @punctuation.bracket)
(struct_pattern
  "," @punctuation.delimiter)

(field_pattern
  ":" @punctuation.delimiter)

(slice_pattern
  ["[" "]"] @punctuation.bracket)
(slice_pattern
  "," @punctuation.delimiter)

(captured_pattern
  "@" @punctuation.delimiter)

(or_pattern
  "|" @punctuation.delimiter)

(range_pattern
  "..=" @operator)

(remaining_field_pattern
  ".." @punctuation.delimiter)

(match_pattern
  "if" @conditional)

(negative_literal "-" @number (integer_literal))
(negative_literal "-" @float (float_literal))

; Function calls

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (scoped_identifier
              (identifier) @function.call .))

(call_expression
  function: (field_expression
    field: (field_identifier) @method.call))

(generic_function
  function: (identifier) @function.call)

(generic_function
  function: (scoped_identifier
    name: (identifier) @function.call))

(generic_function
  function: (field_expression
    field: (field_identifier) @method.call))

(arguments ["(" ")"] @punctuation.bracket)
(arguments "," @punctuation.delimiter)

(type_arguments  ["<" ">"] @punctuation.bracket)
(type_arguments  "," @punctuation.bracket)

(type_binding "=" @punctuation.delimiter) ; i.e. IntoIterator<Item=i32>


(await_expression "await" @keyword.coroutine)

(return_expression "return" @keyword.return)


;;;; Operators

(assignment_expression "=" @operator)

(binary_expression ["+" "-" "*" "/" "%"] @operator.arithmetic)
(compound_assignment_expr ["+=" "-=" "*=" "/=" "%="] @operator.arithmetic)

(binary_expression ["|" "&" "^" "<<" ">>"] @operator.bitwise)
(compound_assignment_expr ["|=" "&=" "^=" "<<=" ">>="] @operator.bitwise)

(binary_expression ["||" "&&"] @operator.logical)

(binary_expression ["==" "!=" "<" ">" "<=" ">="] @operator.comparison)

(unary_expression "!" @operator.bitwise)

(unary_expression "-" @operator.arithmetic)

(unary_expression "-" @number (integer_literal))

(unary_expression "-" @float (float_literal))

(try_expression "?" @operator)

(range_expression [".." "..="] @operator)

(type_cast_expression "as" @keyword.operator)


;;;; Statements

(if_expression "if" @conditional)
(else_clause "else" @conditional)
(match_expression "match" @conditional)

(while_expression "while" @repeat)
(for_expression "for" @repeat "in" @repeat)
(loop_expression "loop" @repeat)
(break_expression "break" @repeat)
(continue_expression "continue" @repeat)

(try_block "try" @keyword)


;;;; Comments

((line_comment) @comment
  (#lua-match? @comment "^//[^/!]"))

((line_comment) @comment
  (#lua-match? @comment "^//$"))

((line_comment) @comment
  (#lua-match? @comment "^////"))

((line_comment) @comment.documentation
  (#lua-match? @comment.documentation "^///[^/]"))

((line_comment) @comment.documentation
  (#lua-match? @comment.documentation "^///$"))

((line_comment) @comment.documentation
  (#lua-match? @comment.documentation "^//!"))

(block_comment) @comment

((block_comment) @comment.documentation
  (#lua-match? @comment.documentation "^/[*][*][^*].*[*]/$"))

((block_comment) @comment.documentation
  (#lua-match? @comment.documentation "^/[*][!]"))




;;;; Literals

(boolean_literal) @boolean
(integer_literal) @number
(float_literal) @float
(raw_string_literal) @string
(string_literal) @string
(escape_sequence) @string.escape
(char_literal) @character

(array_expression
  ["[" "]"] @punctuation.bracket)
(array_expression
  ["," ";"] @punctuation.delimiter)

(tuple_expression
  ["(" ")"] @punctuation.bracket)
(tuple_expression
  "," @punctuation.delimiter)

(unit_expression
  ["(" ")"] @type.builtin)








;;;; Attributes

(inner_attribute_item ["#" "!" "[" "]"] @attribute.delimiter)
(attribute_item ["#" "[" "]"] @attribute.delimiter)

((attribute) @attribute (#set! priority 110))

(attribute
  arguments: (token_tree ["(" "," ")"] @attribute.delimiter))


; TODO:
;  as: <x as y> and 7i16 as i32

