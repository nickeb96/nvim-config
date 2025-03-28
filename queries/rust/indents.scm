[
  (mod_item)
  (struct_item)
  (enum_item)
  (impl_item)
  (struct_expression)
  (struct_pattern)
  (tuple_struct_pattern)
  (tuple_expression)
  (tuple_type)
  (tuple_pattern)
  (match_block)
  (call_expression)
  (assignment_expression)
  (arguments)
  (block)
  (where_clause)
  (use_list)
  (array_expression)
  (ordered_field_declaration_list)
  (field_declaration_list)
  (enum_variant_list)
  (parameters)
  (token_tree)
  (token_repetition)
  (macro_definition)
] @indent.begin

; Typing in "(" inside macro definitions breaks the tree entirely
; Making macro_definition becoming errors
; Offset this by adding back one indent for start of macro rules
(ERROR
  .
  "macro_rules!"
  [
    "("
    "{"
    "["
  ] @indent.begin
  (#set! indent.immediate)
  (#set! indent.start_at_same_line))

(macro_definition
  [
    ")"
    "}"
    "]"
  ] @indent.end)

(trait_item
  body: (_) @indent.begin)

(string_literal
  (escape_sequence)) @indent.begin

(foreign_mod_item
  body: (_) @indent.begin)

(foreign_mod_item
  body: (declaration_list
    "}" @indent.end))

(block
  "}" @indent.end)

(enum_item
  body: (enum_variant_list
    "}" @indent.end))

(impl_item
  body: (declaration_list
    "}" @indent.end))

(match_expression
  body: (match_block
    "}" @indent.end))

(mod_item
  body: (declaration_list
    "}" @indent.end))

(struct_item
  body: (field_declaration_list
    "}" @indent.end))

(struct_expression
  body: (field_initializer_list
    "}" @indent.end))

(struct_pattern
  "}" @indent.end)

(tuple_struct_pattern
  ")" @indent.end)

(tuple_type
  ")" @indent.end)

(tuple_pattern
  ")" @indent.end)

(trait_item
  body: (declaration_list
    "}" @indent.end))

(impl_item
  (where_clause) @indent.dedent)

[
  "where"
  ")"
  "]"
  "}"
] @indent.branch

(impl_item
  (declaration_list) @indent.branch)

[
  (line_comment)
  (string_literal)
] @indent.ignore

(raw_string_literal) @indent.auto
