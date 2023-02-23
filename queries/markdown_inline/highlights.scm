
(emphasis) @text.italic
(strong_emphasis) @text.bold
(code_span) @text.literal
(strikethrough) @text.strikethrough

((emphasis_delimiter) @punctuation.special (#set! conceal ""))
((code_span_delimiter) @punctuation.special (#set! conceal ""))

(uri_autolink) @text.uri
(inline_link [ "[" "]" ] @punctuation.special (#set! conceal ""))
(inline_link [ "(" (link_destination) ")" ] @text.literal (#set! conceal ""))
(link_text) @text.uri
;(link_destination) @text.literal
(link_title) @text
(image) @punctuation.special
(image_description) @text.literal
(shortcut_link [ "[" "]" ] @punctuation.delimiter (#set! conceal ""))

