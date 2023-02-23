
(fenced_code_block_delimiter) @conceal (#set! conceal "")
(paragraph (inline) @text)

(thematic_break) @punctuation.delimiter

(setext_heading heading_content: (paragraph) @text.h1 (setext_h1_underline) @punctuation.delimiter)
(setext_heading heading_content: (paragraph) @text.h2 (setext_h2_underline) @punctuation.delimiter)

(atx_heading (atx_h1_marker) @punctuation.delimiter heading_content: (inline) @text.h1)
(atx_heading (atx_h2_marker) @punctuation.delimiter heading_content: (inline) @text.h2)
(atx_heading (atx_h3_marker) @punctuation.delimiter heading_content: (inline) @text.h3)
(atx_heading (atx_h4_marker) @punctuation.delimiter heading_content: (inline) @text.h4)
(atx_heading (atx_h5_marker) @punctuation.delimiter heading_content: (inline) @text.h5)
(atx_heading (atx_h6_marker) @punctuation.delimiter heading_content: (inline) @text.h6)

(list_marker_minus) @punctuation.delimiter
(list_marker_plus) @punctuation.delimiter
(list_marker_star) @punctuation.delimiter
(list_marker_parenthesis) @punctuation.delimiter
(list_marker_dot) @punctuation.delimiter
(task_list_marker_checked) @punctuation.delimiter
(task_list_marker_unchecked) @punctuation.delimiter

(block_quote) @text
(block_quote_marker) @punctuation.delimiter

(fenced_code_block) @text.literal
;(fenced_code_block_delimiter) @punctuation.delimiter

(link_reference_definition) @punctuation.delimiter


