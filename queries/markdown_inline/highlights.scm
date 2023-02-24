
(emphasis) @text.italic
(strong_emphasis) @text.bold
(code_span) @text.literal @nospell
(strikethrough) @text.strikethrough @nospell

((emphasis_delimiter) @punctuation.special (#set! conceal ""))
((code_span_delimiter) @punctuation.special (#set! conceal ""))

(uri_autolink) @text.uri @nospell
(inline_link [ "[" "]" ] @punctuation.special (#set! conceal ""))
(inline_link [ "(" (link_destination) ")" ] @text.literal @nospell (#set! conceal ""))
(link_text) @text.uri
;(link_destination) @text.literal
(link_title) @text
(image) @punctuation.special
(image_description) @text.literal
(shortcut_link [ "[" "]" ] @punctuation.delimiter (#set! conceal ""))

